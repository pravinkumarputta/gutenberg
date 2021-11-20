import 'package:equatable/equatable.dart';
import 'package:gutenberg/app/network/models/api_exception.dart';
import 'package:gutenberg/app/pages/books_page/models/models.dart';

class BookState extends Equatable {
  // state params
  final bool isLoading;
  final bool isFailure;
  final AppException exception;
  final List<Book> data;
  final bool isLastPage;
  final int page;

  BookState({
    this.isLoading,
    this.isFailure,
    this.exception,
    this.data,
    this.isLastPage,
    this.page,
  });

  @override
  List<Object> get props => [
        this.isLoading,
        this.isFailure,
        this.exception,
        this.data,
        this.isLastPage,
        this.page,
      ];

  @override
  String toString() {
    return '''
    BookState({
    isLoading: $isLoading,
    isFailure: $isFailure,
    data: $data,
    isLastPage: $isLastPage,
    page: $page,
  })
    ''';
  }

  BookState copyWith({
    isLoading,
    isFailure,
    exception,
    data,
    isLastPage,
    page,
  }) {
    return BookState(
      isLoading: isLoading ?? this.isLoading,
      isFailure: isFailure ?? this.isFailure,
      exception: exception ?? this.exception,
      data: data ?? this.data,
      isLastPage: isLastPage ?? this.isLastPage,
      page: page ?? this.page,
    );
  }

  factory BookState.empty() {
    return BookState(
      isLoading: true,
      isFailure: false,
      exception: null,
      data: [],
      isLastPage: false,
      page: 1,
    );
  }
}
