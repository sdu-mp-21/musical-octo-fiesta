import 'package:BookStore/services/books.dart';
import 'package:BookStore/services/genres.dart';
import 'package:BookStore/widgets/booksWidget/booksContainer.dart';
import 'package:BookStore/widgets/categoryWidget/Category.dart';
import 'package:BookStore/widgets/categoryWidget/CategotyLoading.dart';
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
    return Column(
      children: [
        WelcomeCard(firstName: "Tom"),
        FutureBuilder(
            future: getGenres(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                // Future hasn't finished yet, return a placeholder
                return CategoryLoading();
              }
              return Category(currentGenre: 0, genres: snapshot.data);
            }),
        FutureBuilder(
            future: getAllBooks(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                // Future hasn't finished yet, return a placeholder
                return Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: CircularProgressIndicator());
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
