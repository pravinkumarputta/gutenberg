import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gutenberg/app/pages/books_page/books.dart';
import 'package:gutenberg/app/pages/home_page/models/genre.dart';

class GenreCard extends StatelessWidget {
  final Genre _genre;

  const GenreCard(this._genre);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: ListTile(
        onTap: () {
          // navigate to click genre books page
          Navigator.of(context).pushNamed(BooksPage.route(), arguments: BooksPageArguments(_genre.title));
        },
        leading: SvgPicture.asset(
          _genre.icon,
          height: 24,
          width: 24,
        ),
        title: Text(
          _genre.title,
          style: Theme.of(context).textTheme.headline3,
        ),
        trailing: SvgPicture.asset(
          'assets/icons/Next.svg',
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}
