import 'package:dio/dio.dart';
import 'package:gutenberg/app/network/models/api_exception.dart';
import 'package:gutenberg/app/network/models/api_response.dart';
import 'package:gutenberg/app/network/network.dart';
import 'package:gutenberg/app/pages/books_page/models/models.dart';
import 'package:gutenberg/app/utils/utils.dart';
import 'package:vexana/vexana.dart';

import 'book_repository.dart';

class BookRepositoryImpl extends BookRepository {
  final AppNetworkManager appNetworkManager;

  BookRepositoryImpl(this.appNetworkManager);

  @override
  Future<ApiResponse<BookResponse>> fetchBooks(String topic, int page, {String search, CancelToken cancelToken}) async {
    // check network connectivity
    if (!(await appNetworkManager.hasNetworkConnectivity())) {
      return ApiResponse.failure(0, AppException(Errors.NO_NETWORK_CONNECTIVITY));
    }

    // prepare url
    var url = 'books?topic=${topic.toLowerCase()}&page=$page';
    if (search != null && search.trim().isNotEmpty) {
      url += '&search=${search.trim().toLowerCase()}';
    }

    var response = await appNetworkManager.networkManager.send<BookResponse, BookResponse>(
      url,
      parseModel: BookResponse(),
      method: RequestType.GET,
      cancelToken: cancelToken,
    );
    if (response.error != null) {
      print('fetchBooks:${response.error?.statusCode}');
      return ApiResponse.failure(response.error.statusCode, AppException(Errors.UNKNOWN, message: response.error.response['detail']));
    }
    return ApiResponse.success(response.data);
  }
}
