import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:gutenberg/app/constants/network.dart';
import 'package:vexana/vexana.dart';

class AppNetworkManager {
  AppNetworkManager();

  get _interceptor => InterceptorsWrapper(onRequest: (options, handler) {
        // Do something before request is sent
        print('onRequest-data');
        print(options.data);

        // do some operation

        return handler.next(options);
      }, onResponse: (response, handler) {
        // Do something with response data
        print('onResponse-data');
        print(response.data);
        return handler.next(response);
      }, onError: (DioError e, handler) {
        // Do something with response error
        print('onError-data');
        print(e.response.data);
        handler.next(e);
      });

  NetworkManager get networkManager => NetworkManager(options: BaseOptions(baseUrl: BASE_URL), interceptor: _interceptor, isEnableLogger: kDebugMode);

  Future<bool> hasNetworkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi;
  }

  Future<bool> hasDataConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.mobile;
  }

  Future<bool> hasWifiConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.wifi;
  }
}
