import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int x = 0;
  int degree = 0;

  String getText() {
    if (degree == 0) {
      return "1     3   5    7\n9   11 13 15\n17 19 21 23\n25 27 29 31";
    } else if (degree == 1) {
      return "2     3    6   7\n10 11 14 15\n18 19 22 23\n26 27 30 31";
    } else if (degree == 2) {
      return "4     5    6   7\n12 13 14 15\n20 21 22 23\n28 29 30 31";
    } else if (degree == 3) {
      return "8     9  10 11\n12 13 14 15\n24 25 26 27\n28 29 30 31";
    } else if (degree == 4) {
      return "16 17 18 19\n20 21 22 23\n24 25 26 27\n28 29 30 31";
    } else {
      return "Your BD is $x";
    }
  }

  void nextState(addNumber) {
    setState(() {
      if (addNumber) {
        x += pow(2, degree);
      }
      degree += 1;
    });
  }

  Widget getControls() {
    if (degree < 5) {
      return Row(
        children: [
          Spacer(),
          ElevatedButton(onPressed: () => nextState(false), child: Text("No")),
          SizedBox(width: 10),
          ElevatedButton(onPressed: () => nextState(true), child: Text("Yes")),
          Spacer()
        ],
      );
    } else {
      return Spacer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guess my birthday'),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text(
            "Do you see your BD here?",
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 10),
          Text(
            getText(),
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          getControls()
        ],
      ),
    );
  }
}
