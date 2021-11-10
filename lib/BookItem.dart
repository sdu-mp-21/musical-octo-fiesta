import 'package:BookStore/models/book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../bookpage.dart';

class BookItem extends StatelessWidget {
  final Book book;

  BookItem(this.book);

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
            padding: EdgeInsets.all(5),
            child: Stack(children: [
              SizedBox(
                  width: 180,
                  height: 230,
                  child: Column(children: [
                    DecoratedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            height: 200,
                            width: 210,
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
                    Text(
                      book.title,
                      style: TextStyle(fontWeight: FontWeight.w800),
                      overflow: TextOverflow.ellipsis,
                    )
                  ])),
            ])));
  }
}
