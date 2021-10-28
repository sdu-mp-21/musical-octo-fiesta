import 'package:flutter/material.dart';

class ProfileDesign extends StatefulWidget {
  const ProfileDesign({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyProfileDesign createState() => new _MyProfileDesign();
}

class _MyProfileDesign extends State<ProfileDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios_new_sharp),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu),
                  //padding: EdgeInsets.all(10),
                  color: Colors.white,
                ),
              ]),
        ],
      ),
    );
  }
}
