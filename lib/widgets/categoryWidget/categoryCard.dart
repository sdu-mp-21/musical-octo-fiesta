import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String label;
  final int index;
  final bool isSelected;

  const CategoryCard({Key key, this.label, this.index, this.isSelected})
      : super(key: key);

  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 10),
      child: Text(
        label,
        style: TextStyle(
            color: isSelected ? Colors.white : Colors.black54,
            fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1.0,
              color: !isSelected
                  ? Color.fromRGBO(0, 0, 0, 0.1)
                  : Colors.transparent),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(isSelected ? 0.2 : 0),
              spreadRadius: 4,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ]),
    ));
  }
}
