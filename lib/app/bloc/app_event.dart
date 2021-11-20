import 'package:equatable/equatable.dart';
import 'package:gutenberg/app/utils/utils.dart';

abstract class AppEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends AppEvent {}

class AppThemeChanged extends AppEvent {
  final AppThemes theme;

  AppThemeChanged(this.theme);

  @override
  String toString() {
    return '''
    AppThemeChanged(styles: ${theme.value})
    ''';
  }
}
