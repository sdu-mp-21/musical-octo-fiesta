import 'package:BookStore/models/book.dart';
import 'package:BookStore/widgets/noBooksCard.dart';
import 'package:flutter/cupertino.dart';
import '../showMoreCard.dart';
import 'bookCard.dart';

class BooksContainer extends StatelessWidget {
  final List<Book> books;

  const BooksContainer({this.books});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 246,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: books.length > 0
              ? [
                  for (var i = 0; i < books.length; i++) BookCard(books[i]),
                  ShowMoreCard()
                ]
              : [NoBooksCard()],
        ));
  }
}
