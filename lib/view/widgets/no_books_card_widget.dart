import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class NoBooksCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              child: HeroIcon(HeroIcons.emojiSad, color: Colors.white),
            ),
            SizedBox(height: 4),
            Text("No books found",
                style: TextStyle(fontWeight: FontWeight.w500))
          ],
        ));
  }
}
