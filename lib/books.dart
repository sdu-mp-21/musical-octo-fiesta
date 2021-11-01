import "package:flutter/material.dart";
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:BookStore/bookpage.dart';

class Books extends StatefulWidget {
  const Books({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyBook createState() => new _MyBook();
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
        Image.asset(book.image, fit: BoxFit.fitHeight),
        Text(book.title, overflow: TextOverflow.ellipsis)
      ],
    ),
  );
}

// Widget chosenBook({title, author, rating, image}) {
//   Future<List<Book>> _getBooks() async {
//     Uri uri = Uri.parse(
//         'https://run.mocky.io/v3/a9268d47-f74b-44a1-bb5c-c4e46c7a26fc');
//     var bookData = await http.get(uri);

//     var jsonBook = json.decode(bookData.body) as Map<String, dynamic>;

//     List<Book> allBooks = [];
//     for (var i in jsonBook["books"]) {
//       Book book = Book(
//           i["index"], i["bookName"], i["bookAuthor"], i["price"], i["image"]);
//       allBooks.add(book);
//     }
//   }

//   return GestureDetector(
//     onTap: () {
//       Navigator.push(
//         context[0],
//         MaterialPageRoute(builder: (context) => MyItemPage()),
//       );
//     },
//   );
// }

Widget buildBody() {
  Future<List<Book>> _getBooks() async {
    Uri uri = Uri.parse(
        'https://run.mocky.io/v3/062c0818-f92a-4363-b5dd-cab6c67262e0');
    var bookData = await http.get(uri);

    var jsonData = json.decode(bookData.body) as Map<String, dynamic>;

    List<Book> allBooks = [];
    for (var jsonBook in jsonData["books"]) {
      Book book = Book(
          title: jsonBook["title"],
          id: jsonBook["id"],
          price: jsonBook["price"],
          author: jsonBook["author"],
          image: jsonBook["image"],
          description: jsonBook["description"],
          category: jsonBook["category"]);
      allBooks.add(book);
    }

    print(allBooks);
    return allBooks;
  }

  return Scaffold(
    appBar: new AppBar(),
    body: Container(
      child: FutureBuilder(
          future: _getBooks(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            }
            return BooksWidget(snapshot.data);
          }),
    ),
  );
}

class _MyBook extends State<Books> {
  @override
  Widget build(BuildContext context) {
    return buildBody();
  }
}

// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(),
//       body: Container(
//         child: FutureBuilder(
//             future: _getBooks(),
//             builder: (BuildContext context, AsyncSnapshot snapshot) {
//               if (!snapshot.hasData) {
//                 return Container(
//                   child: Center(
//                     child: Text("Loading..."),
//                   ),
//                 );
//               }
//               return BooksWidget(snapshot.data);
//             }),
//       ),
//     );
//   }
// }

class Book {
  final String id;
  final String title;
  final String author;
  final String price;
  final String image;
  final String description;
  final String category;

  Book(
      {this.id,
      this.title,
      this.author,
      this.price,
      this.image,
      this.description,
      this.category});
}
