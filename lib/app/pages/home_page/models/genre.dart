import 'package:equatable/equatable.dart';

class Genre extends Equatable {
  final String title;
  final String icon;

  Genre({this.title, this.icon});

  Map<String, dynamic> toJson() {
    return {
      'title': this.title,
      'icon': this.icon,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return Genre(
      title: json['title'],
      icon: json['icon'],
    );
  }

  @override
  List<Object> get props => [title, icon];

  @override
  String toString() {
    return '''
    Genre({title: $title, icon: $icon})
    ''';
  }
}
