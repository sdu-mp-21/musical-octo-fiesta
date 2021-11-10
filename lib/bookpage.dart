import 'dart:ui';

import 'package:BookStore/models/book.dart';
import 'package:BookStore/services/books.dart';
import "package:flutter/material.dart";

class MyItemPage extends StatefulWidget {
  final String title;
  final Book book;
  final String id;
  const MyItemPage({Key key, this.title, this.book, this.id}) : super(key: key);
  @override
  _MyItemPageState createState() => new _MyItemPageState();
}

Widget _bookWidget({title, author, rating, page}) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: SizedBox(
      width: 100,
      height: 50,
      child: Row(
        children: [
          Container(
            child: Text(page.toString(),
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center),
            width: 50,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  topLeft: Radius.circular(5)),
            ),
          ),
          Container(
            child: Text(
              rating.toString(),
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            width: 50,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  topLeft: Radius.circular(5)),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildContent(Book book) {
  return Column(
    children: [
      Container(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              book.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono',
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Column(children: [
              Text(
                book.description,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ]),
          ),
        ]),
      ),
    ],
  );
}

class _MyItemPageState extends State<MyItemPage> {
  var top = 0.0;
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  Widget _buildBody(Book book) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 400,
                  flexibleSpace: Container(
                    height: 400,
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          child: ImageFiltered(
                            imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child: Image.network(book.image,
                                fit: BoxFit.cover, width: double.infinity),
                          ),
                        ),
                        Align(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Image.network(book.image,
                                width: 250, height: 300),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: buildContent(book),
                ),
              ],
            ),
            _addFav(),
          ],
        ),
      ),
    );
  }

  Widget _addFav() {
    final double defMargin = 360;
    final double defStart = 250;
    final double defEnd = defStart / 2;

    double top = defMargin;
    double scale = 1.0;

    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defStart - defEnd) {
        scale = 1.0;
      } else if (offset < defStart - defEnd) {
        scale = (defMargin - defEnd - offset);
      } else {
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 16,
      child: FloatingActionButton(
        backgroundColor: Colors.orange.shade100,
        child: Icon(Icons.shopping_cart),
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder(
            future: getBookById(widget.id),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                // Future hasn't finished yet, return a placeholder
                return Scaffold(body: Center(child: Text('Loading...')));
              }
              return _buildBody(snapshot.data);
            }));
  }
}
