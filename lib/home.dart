import 'package:BookStore/services/books.dart';
import 'package:BookStore/services/genres.dart';
import 'package:BookStore/widgets/booksWidget/booksContainer.dart';
import 'package:BookStore/widgets/categoryWidget/categories.dart';
import 'package:BookStore/widgets/welcomeCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<Home> {
  int currentGenre = 0;

  Widget _Body() {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        WelcomeCard(firstName: "Tom"),
        FutureBuilder(
            future: getGenres(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                // Future hasn't finished yet, return a placeholder
                return Center(child: Text('Loading...'));
              }
              return Category(currentGenre: 0, genres: snapshot.data);
            }),
        FutureBuilder(
            future: getAllBooks(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                // Future hasn't finished yet, return a placeholder
                return Center(child: Text('Loading...'));
              }
              return BooksContainer(books: snapshot.data);
            })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: _Body());
  }
}
