import 'package:flutter/cupertino.dart';
import 'CategoryCard.dart';

class CategoryLoading extends StatelessWidget {
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
              for (var i = 0; i < 8; i++)
                GestureDetector(
                    onTap: () => {},
                    child: CategoryCard(
                        index: i,
                        label: "                    ",
                        isSelected: false))
            ]));
  }
}
