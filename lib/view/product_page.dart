import 'package:BookStore/models/book.dart';
import 'package:BookStore/services/books.dart';
import 'package:BookStore/view/widgets/book_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key key, this.id}) : super(key: key);

  final String id;
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>{

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange.shade100,
      ),
      backgroundColor: Color(0xFFEEEEEE),
      body:

      FutureBuilder(
          future: getBooksByGenre(widget.id),
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
                    children: bookList(snapshot.data)
                  );
                }
            }
          }),

    );
  }
}


