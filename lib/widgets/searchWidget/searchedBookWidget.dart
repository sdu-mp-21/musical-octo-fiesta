import 'package:BookStore/models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../bookpage.dart';

class SearchedBookWidget extends StatelessWidget {
  final Book book;

  const SearchedBookWidget(this.book);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => MyItemPage(id: book.id)),
          );
        },
        child: new Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 3, // 60% of space => (6/(6 + 4))
                  child: Container(
                    width: 64,
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                          image: NetworkImage(book.image),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                Expanded(
                    flex: 10, // 60% of space => (6/(6 + 4))
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.title,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(book.description),
                            SizedBox(height: 20),
                            Text(book.price.toString())
                          ],
                        ))),
                Expanded(
                    flex: 1, // 60% of space => (6/(6 + 4))
                    child: Text(
                      book.rating.toString(),
                      textAlign: TextAlign.start,
                    ))
              ],
            )));
  }
}
