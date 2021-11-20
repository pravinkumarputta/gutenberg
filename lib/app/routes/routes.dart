import 'package:flutter/cupertino.dart';
import 'package:gutenberg/app/pages/books_page/books.dart';
import 'package:gutenberg/app/pages/home_page/home.dart';

class AppRouter {
  static initRouter() {
    return <String, WidgetBuilder>{
      HomePage.route(): (BuildContext context) => HomePage(),
      BooksPage.route(): (BuildContext context) => BooksPage(ModalRoute.of(context).settings.arguments),
    };
  }
}
