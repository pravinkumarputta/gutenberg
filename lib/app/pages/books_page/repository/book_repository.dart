import 'package:dio/dio.dart';
import 'package:gutenberg/app/network/models/api_response.dart';
import 'package:gutenberg/app/pages/books_page/models/book_response.dart';

abstract class BookRepository {
  Future<ApiResponse<BookResponse>> fetchBooks(String topic, int page, {String search, CancelToken cancelToken});
}
