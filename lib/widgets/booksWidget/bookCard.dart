import 'package:BookStore/models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../bookpage.dart';

class BookCard extends StatelessWidget {
  final Book book;

  BookCard(this.book);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyItemPage(id: book.id)),
          );
        },
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Stack(children: [
              SizedBox(
                  width: 120,
                  height: 230,
                  child: Column(children: [
                    Container(
                      height: 180,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                            image: NetworkImage(book.image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      book.title,
                      style: TextStyle(fontWeight: FontWeight.w800),
                    )
                  ])),
              Positioned(
                  top: 10,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade500,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        Text(
                          book.rating.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  )),
            ])));
  }
}
