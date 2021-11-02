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
      backgroundColor: Colors.blue,
      body: ListView(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios_new_sharp),
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.border_color_sharp),
                  //padding: EdgeInsets.all(10),
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                ),
              ]),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Column(children: <Widget>[
                  Text('Tom Holland',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0)),
                  Text('tomholland@gmail.com',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w100,
                        fontSize: 18,
                        color: Colors.white,
                      )),
                ]),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/pctr.jpg'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
