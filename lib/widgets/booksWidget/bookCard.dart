import 'package:BookStore/models/book.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
                    DecoratedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            height: 180,
                            width: 150,
                            fit: BoxFit.cover,
                            imageUrl: book.image,
                            placeholder: (context, url) => Icon(Icons.image),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.05),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(0, 6), // Shadow position
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      book.title,
                      style: TextStyle(fontWeight: FontWeight.w800),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      book.price.toString() + " ₸",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black38),
                    ),
                  ])),
              Positioned(
                  top: 10,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade600,
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
