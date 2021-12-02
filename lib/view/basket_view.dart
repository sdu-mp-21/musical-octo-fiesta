import "package:flutter/material.dart";
import 'package:BookStore/models/book.dart';
import 'package:BookStore/services/books.dart';
import 'package:BookStore/view/widgets/book_card_in_basket_widget.dart';
import 'package:flutter/widgets.dart';

class Basket extends StatefulWidget {
  const Basket({Key key, this.id}) : super(key: key);

  final String id;
  @override
  _MyBasket createState() => new _MyBasket();
}

class _MyBasket extends State<Basket> {
  List<Widget> bookList(List<Book> books) {
    List<Widget> list = [];
    for (Book book in books) {
      list.add(new BookCard(book));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/baner2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: FutureBuilder(
          future: getAllBooks(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Text("Loading..");
              default:
                if (snapshot.hasError) {
                  return Text('Error');
                } else {
                  return GridView.count(
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: 2,
                      // Generate 100 widgets that display their index in the List.
                      children: bookList(snapshot.data));
                }
            }
          }),
    ));
  }
}
