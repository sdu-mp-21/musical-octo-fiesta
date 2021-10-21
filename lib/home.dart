import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class Book {
  String title, price, image;
  Book({String title, String price, String image}) {
    this.title = title;
    this.price = price;
    this.image = image;
  }
  @override
  String toString() {
    return "$title $price $image";
  }
}

Future<List<Book>> getBooks(query) async {
  List<Book> books = [];
  var url = Uri.https('api.itbook.store', '/1.0/search/$query');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    for (var jsonBook in jsonResponse["books"]) {
      Book book = new Book(
          title: jsonBook["title"],
          price: jsonBook["price"],
          image: jsonBook["image"]);
      books.add(book);
    }
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  return books;
}

Widget BooksWidget(List<Book> books) {
  List<Widget> list = [];
  for (Book book in books) {
    list.add(BookWidget(book));
  }
  return ListView(padding: const EdgeInsets.all(8), children: list);
}

Widget BookWidget(Book book) {
  return Container(
    height: 100,
    child: Row(
      children: [
        Image.network(book.image, fit: BoxFit.fitHeight),
        Text(book.title, overflow: TextOverflow.ellipsis)
      ],
    ),
  );
}

class _HomeWidgetState extends State<Home> {
  List<Book> books = [];

  @override
  Widget build(BuildContext context) {
    const List<String> bookNames = ["mongodb", "google", "react", "interview"];
    var random = new Random();
    String randomBookName = bookNames[random.nextInt(bookNames.length)];
    return SafeArea(
        child: FutureBuilder(
            future: getBooks(randomBookName),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                // Future hasn't finished yet, return a placeholder
                return Center(child: Text('Loading...'));
              }
              return BooksWidget(snapshot.data);
            }));
  }
}
