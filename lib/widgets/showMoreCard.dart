import 'package:BookStore/books.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class ShowMoreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Books()),
          );
        },
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      color: Color(0xFF442B2D),
                      borderRadius: BorderRadius.circular(18)),
                  alignment: Alignment.center,
                  child: HeroIcon(HeroIcons.arrowRight, color: Colors.white),
                ),
                SizedBox(height: 4),
                Text("Показать все",
                    style: TextStyle(fontWeight: FontWeight.w500))
              ],
            )));
  }
}
