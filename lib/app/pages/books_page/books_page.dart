import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gutenberg/app/network/network.dart';
import 'package:gutenberg/app/pages/books_page/bloc/bloc.dart';
import 'package:gutenberg/app/pages/books_page/models/book.dart';
import 'package:gutenberg/app/pages/books_page/repository/book_repository_impl.dart';
import 'package:gutenberg/app/pages/books_page/widgets/book_tile.dart';
import 'package:gutenberg/app/pages/books_page/widgets/search_bar.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class BooksPageArguments {
  String genre;

  BooksPageArguments(this.genre);
}

class BooksPage extends StatefulWidget {
  static route() => 'BooksPage';

  // fields
  final BooksPageArguments _arguments;

  const BooksPage(this._arguments);

  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  final PagingController<int, Book> _pagingController = PagingController(firstPageKey: 0);
  BookBloc _bookBloc;
  StreamSubscription _bookStateSubscription;
  String _searchKey = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // init bloc
    _bookBloc = BookBloc(BookRepositoryImpl(Provider.of<AppNetworkManager>(context)));

    _bookStateSubscription = _bookBloc.stream.listen((bookState) {
      print('_bookStateSubscription:${bookState.exception?.message}');
      if (bookState.isLoading) {
        return;
      }
      _pagingController.value = PagingState(
        nextPageKey: bookState.data.length,
        error: bookState.exception?.message,
        itemList: bookState.data,
      );
    });
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _bookStateSubscription.cancel();
    _bookBloc.close();
    super.dispose();
  }

  _fetchPage(int pageKey) async {
    // go for next page
    _bookBloc.add(BookFetched(widget._arguments.genre, page: _bookBloc.state.page, search: _searchKey));
  }

  _searchBooks(String searchKey) async {
    this._searchKey = searchKey;
    // go for next page
    _bookBloc.add(BookFetched(widget._arguments.genre, page: 1, search: searchKey, clear: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._arguments.genre),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: SearchBar(
              onInputChange: _searchBooks,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: PagedGridView<int, Book>(
                pagingController: _pagingController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.48,
                  crossAxisCount: 3,
                ),
                builderDelegate: PagedChildBuilderDelegate<Book>(
                  itemBuilder: (context, item, index) => BookTile(item),
                ),
                showNewPageErrorIndicatorAsGridChild: false,
                showNewPageProgressIndicatorAsGridChild: false,
                showNoMoreItemsIndicatorAsGridChild: false,
              ),
            ),
          )
        ],
      ),
    );
  }
}
