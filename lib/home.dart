import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

Widget welcomeWidget(String firstName) {
  return Container(
      padding: EdgeInsets.all(10),
      child: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              image: AssetImage("assets/images/08.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hello, $firstName!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Which book suits your current mood?",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(14),
      ));
}

Widget bookWidget() {
  return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
          width: 120,
          height: 200,
          child: Column(children: [
            Container(
              height: 200,
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage("assets/images/baner.png"),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 7,
                      blurRadius: 5,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ]),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "The Popply War",
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            Text("R.F. Kuang",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w600))
          ])));
}

Widget _buildBody() {
  return ListView(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    children: [
      welcomeWidget("Maira"),
      Container(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              bookWidget(),
              bookWidget(),
              bookWidget(),
              bookWidget(),
              bookWidget(),
            ],
          ))
    ],
  );
}

class _HomeWidgetState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: FutureBuilder(builder: (context, snapshot) {
      // if (!snapshot.hasData) {
      //   // Future hasn't finished yet, return a placeholder
      //   return Center(child: Text('Loading...'));
      // }
      return _buildBody();
    }));
  }
}
