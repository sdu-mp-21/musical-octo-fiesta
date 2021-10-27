import "package:flutter/material.dart";
import 'main.dart';

class Books extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Show books by category")),
      body: ListWheelScrollView(
        itemExtent: 220,
        diameterRatio: 3,
        children: [
          for (int i = 0; i < 10; i++)
            new Container(
              width: 300,
              height: 200,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
            )
        ],
      ),
    );
  }
}
