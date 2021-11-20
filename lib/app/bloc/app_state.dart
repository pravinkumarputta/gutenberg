import 'package:equatable/equatable.dart';
import 'package:gutenberg/app/utils/utils.dart';

class AppState extends Equatable {
  final AppThemes selectedTheme;

  AppState({this.selectedTheme});

  @override
  // TODO: implement props
  List<Object> get props => [selectedTheme];

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }

  AppState copyWith({selectedTheme}) {
    return AppState(
      selectedTheme: selectedTheme ?? this.selectedTheme,
    );
  }

  factory AppState.empty() {
    return AppState(selectedTheme: AppThemes.system);
  }
}
