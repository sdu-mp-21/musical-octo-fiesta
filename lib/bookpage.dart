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

Widget _buildBody(Book book) {
  return Scaffold(
    body: Padding(
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          Container(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.lightBlue.shade400,
                  expandedHeight: 300,
                  flexibleSpace: Container(
                    height: 300,
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
                            child: Image.network(book.image,
                                width: 180, height: 200),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// Widget _buildBody(Book book) {
//   return Scaffold(
//     appBar: new AppBar(
//         title: Center(child: Text(book.title)),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {},
//         ),
//         backgroundColor: Colors.blue.shade500,
//         actions: <Widget>[
//           // ignore: deprecated_member_use
//           IconButton(
//             icon: const Icon(Icons.more_horiz),
//             onPressed: () {},
//           )
//         ]),
//     body: Padding(
//       padding: EdgeInsets.all(10),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             ListView(
//               scrollDirection: Axis.vertical,
//               shrinkWrap: true,
//               physics: ClampingScrollPhysics(),
//               children: <Widget>[
//                 Container(
//                     child: Image.network(
//                   book.image,
//                   width: 180,
//                   height: 200,
//                 )),
//                 Center(
//                   child: Row(
//                     children: [
//                       _bookWidget(
//                           title: book.title,
//                           author: book.author,
//                           rating: book.rating,
//                           page: book.pageCount),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(5),
//                   margin: EdgeInsets.all(5),
//                   child: Text('Description',
//                       style: TextStyle(
//                           fontWeight: FontWeight.w800,
//                           fontSize: 16,
//                           fontStyle: FontStyle.italic)),
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(5),
//                   margin: EdgeInsets.all(5),
//                   child: Text(
//                     book.description,
//                     textAlign: TextAlign.justify,
//                     style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 Container(
//                   child: Center(
//                     child: Row(
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.favorite,
//                               color: Colors.redAccent),
//                           onPressed: () {},
//                           iconSize: 35,
//                         ),
//                         RaisedButton(
//                           onPressed: () {},
//                           child: Text(
//                             "Add to card",
//                             style: TextStyle(color: Colors.blueAccent),
//                           ),
//                           color: Colors.blue[100],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

class _MyItemPageState extends State<MyItemPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.id);
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
