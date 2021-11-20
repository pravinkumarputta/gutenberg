import 'enums.dart';

extension AppThemesExtension on AppThemes {
  String get value {
    switch (this) {
      case AppThemes.light:
        return 'light';
      case AppThemes.dark:
        return 'dark';
      case AppThemes.system:
        return 'system';
    }
  }

  AppThemes detect(value) {
    switch (value) {
      case 'light':
        return AppThemes.light;
      case 'dark':
        return AppThemes.dark;
      case 'system':
        return AppThemes.system;
    }
  }
}
