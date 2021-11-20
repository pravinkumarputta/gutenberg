import 'package:flutter/material.dart';
import 'package:gutenberg/app/pages/home_page/models/genre.dart';
import 'package:gutenberg/app/pages/home_page/widgets/genre_card.dart';

class HomePage extends StatefulWidget {
  static route() => 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/Pattern.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Gutenberg Project',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('A social cataloging website that allows you to freely search its database of books, annotations, and reviews.', style: Theme.of(context).textTheme.bodyText1)
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ...getAllGenreList(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  getAllGenreList() {
    var genreList = [];

    // prepare all genre
    var genreListData = [
      Genre(title: 'FICTION', icon: 'assets/icons/Fiction.svg'),
      Genre(title: 'DRAMA', icon: 'assets/icons/Drama.svg'),
      Genre(title: 'HUMOUR', icon: 'assets/icons/Humour.svg'),
      Genre(title: 'POLITICS', icon: 'assets/icons/Politics.svg'),
      Genre(title: 'PHILOSOPHY', icon: 'assets/icons/Philosophy.svg'),
      Genre(title: 'HISTORY', icon: 'assets/icons/History.svg'),
      Genre(title: 'ADVENTURE', icon: 'assets/icons/Adventure.svg'),
    ];

    // prepare genre widget list
    genreList = genreListData.map((genre) => GenreCard(genre)).toList();

    return genreList;
  }
}
