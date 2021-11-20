import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutenberg/app/network/models/api_response.dart';
import 'package:gutenberg/app/pages/books_page/models/book_response.dart';
import 'package:gutenberg/app/pages/books_page/repository/book_repository.dart';

import 'bloc.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository _bookRepository;
  final List<CancelToken> _listOfCancelTokens = [];

  BookBloc(this._bookRepository) : super(BookState.empty()) {
    // map events
    on<BookFetched>(_onBookFetched, transformer: sequential());
  }

  _onBookFetched(BookFetched event, Emitter<BookState> emit) async {
    emit(state.copyWith(
      isLoading: true,
    ));

    // create cancel token
    var cancelToken = CancelToken();
    // add cancel token to list
    _listOfCancelTokens.add(cancelToken);

    var response = await _bookRepository.fetchBooks(event.topic, event.page, search: event.search, cancelToken: cancelToken);

    // remove cancel token from list
    _listOfCancelTokens.remove(cancelToken);

    if (response is ApiFailure) {
      emit(state.copyWith(
        isLoading: false,
        isFailure: true,
        exception: (response as ApiFailure).exception,
      ));
      return;
    }

    // update books state
    var bookResponse = (response as ApiSuccess<BookResponse>);

    emit(state.copyWith(
      isLoading: false,
      isFailure: false,
      exception: null,
      data: event.clear ? bookResponse.data.results : [...state.data, ...bookResponse.data.results],
      isLastPage: bookResponse.data.next == null,
      page: bookResponse.data.next == null ? state.page : state.page + 1,
    ));
  }
}
