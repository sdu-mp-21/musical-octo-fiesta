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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/08.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
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
                    Text('24 years',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w100,
                          fontSize: 13,
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
            SizedBox(height: 40.0),
            Container(
              height: MediaQuery.of(context).size.height - 185.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
              ),
              child: Container(
                margin: EdgeInsets.all(70),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue.withOpacity(0.7),
                                  Colors.amber,
                                ],
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.person_outline_rounded),
                              iconSize: 35,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Nickname",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w100,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "booklover123",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue.withOpacity(0.7),
                                  Colors.amber,
                                ],
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.room_outlined),
                              iconSize: 35,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Address",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w100,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "street f, 21 flat",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue.withOpacity(0.7),
                                  Colors.amber,
                                ],
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.phone),
                              iconSize: 35,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Phone Number",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w100,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "8777777",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
