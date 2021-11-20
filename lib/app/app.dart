import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutenberg/app/bloc/bloc.dart';
import 'package:gutenberg/app/network/network.dart';
import 'package:gutenberg/app/pages/home_page/home.dart';
import 'package:gutenberg/app/preference/preference.dart';
import 'package:gutenberg/app/routes/routes.dart';
import 'package:gutenberg/app/styles/styles.dart';
import 'package:gutenberg/app/utils/utils.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppBloc _appBloc;
  AppPreferenceManager _appPreferenceManager;
  AppNetworkManager _appNetworkManager;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appPreferenceManager = AppPreferenceManager();
    _appNetworkManager = AppNetworkManager();
    _appBloc = AppBloc(_appPreferenceManager);
  }

  @override
  void dispose() {
    _appBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // multi-provider is for dependency injection
    return MultiProvider(
      providers: [
        Provider<AppNetworkManager>(
          create: (_) {
            return AppNetworkManager();
          },
        ),
        Provider<AppPreferenceManager>(
          create: (_) {
            return AppPreferenceManager();
          },
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (_) => _appBloc,
          ),
        ],
        child: BlocBuilder<AppBloc, AppState>(
          builder: (BuildContext context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Gutenberg',
              theme: state.selectedTheme == AppThemes.dark ? AppTheme.darkTheme() : AppTheme.lightTheme(),
              darkTheme: state.selectedTheme == AppThemes.system ? AppTheme.darkTheme() : null,
              home: HomePage(),
              routes: AppRouter.initRouter(),
            );
          },
        ),
      ),
    );
  }
}
