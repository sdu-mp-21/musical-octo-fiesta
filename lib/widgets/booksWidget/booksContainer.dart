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
    int itemsToShow = books.length < 7 ? books.length : 7;
    return Container(
        height: 246,
        child: books.length > 0
            ? ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  for (var i = 0; i < itemsToShow; i++) BookCard(books[i]),
                  if (itemsToShow > 6) ShowMoreCard()
                ],
              )
            : NoBooksCard());
  }
}
