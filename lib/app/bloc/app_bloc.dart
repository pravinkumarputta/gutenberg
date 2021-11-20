import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutenberg/app/constants/constants.dart';
import 'package:gutenberg/app/preference/preference.dart';
import 'package:gutenberg/app/utils/utils.dart';

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppPreferenceManager appPreferenceManager;

  AppBloc(this.appPreferenceManager) : super(AppState.empty()) {
    // map events
    on<AppStarted>(_onAppStarted, transformer: sequential());
    on<AppThemeChanged>(_onAppThemeChanged, transformer: sequential());
  }

  _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    // get selected them
    var selectedTheme = await appPreferenceManager.read(APP_THEME);

    emit(state.copyWith(selectedTheme: AppThemes.system.detect(selectedTheme ?? AppThemes.system)));
  }

  _onAppThemeChanged(AppThemeChanged event, Emitter<AppState> emit) {
    // save selected styles
    appPreferenceManager.write(APP_THEME, event.theme.value);

    emit(state.copyWith(selectedTheme: event.theme));
  }
}
