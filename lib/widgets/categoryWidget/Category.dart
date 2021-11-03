import 'package:BookStore/models/genre.dart';
import 'package:flutter/cupertino.dart';
import 'CategoryCard.dart';

class Category extends StatelessWidget {
  final List<Genre> genres;
  final String currentGenre;
  final bool isLoading;
  const Category({Key key, this.genres, this.currentGenre, this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        child: ListView(
            padding: EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              for (var i = 0; i < genres.length; i++)
                GestureDetector(
                    onTap: () => {},
                    child: CategoryCard(
                        index: i,
                        label: genres[i].name,
                        isSelected: currentGenre == genres[i].id))
            ]));
  }
}
