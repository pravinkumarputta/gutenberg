import 'package:equatable/equatable.dart';

abstract class BookEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class BookFetched extends BookEvent {
  final int page;
  final String search;
  final String topic;
  final bool clear;

  BookFetched(this.topic, {this.page = 1, this.search, this.clear = false});

  @override
  String toString() {
    return '''
    BookFetched(page: $page, search: $search)
    ''';
  }
}
