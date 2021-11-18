import 'package:BookStore/models/genre.dart';
import 'package:BookStore/services/books.dart';
import 'package:BookStore/services/genres.dart';
import 'package:BookStore/widgets/booksWidget/booksContainer.dart';
import 'package:BookStore/widgets/welcomeCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<Home> {
  String currentGenre = "61810b90bc157300169d63fd";

  void changeGenre(id) {
    setState(() {
      currentGenre = id;
    });
  }

  Widget section(String genreId) {
    return FutureBuilder(
        future: getBooksByGenre(genreId),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                  ),
                ),
              );
            default:
              if (snapshot.hasError)
                return Text('');
              else
                return BooksContainer(books: snapshot.data);
          }
        });
  }

  Widget sections(List<Genre> genres) {
    List<Widget> list = [];
    for (Genre genre in genres) {
      list.add(Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            genre.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          )));
      list.add(section(genre.id));
    }
    return Column(
      children: list,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }

  Widget body() {
    return ListView(
      children: [
        WelcomeCard(firstName: "Tom"),
        FutureBuilder(
            future: getGenres(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Text("");
                default:
                  if (snapshot.hasError) {
                    return Text('');
                  } else {
                    return sections(snapshot.data);
                  }
              }
            }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      child: body(),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
    ));
  }
}
