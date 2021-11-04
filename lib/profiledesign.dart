import 'package:flutter/material.dart';
import 'profile.dart';

class ProfileDesign extends StatelessWidget {
  List data2;
  int i2;
  String img1;
  String nameSurname;
  String login;
  String age;
  String address;
  String number;
  ProfileDesign(List data, int i) {
    this.data2 = data;
    this.i2 = i;
    this.img1 = data2[i2]['image'];
    this.nameSurname = data2[i2]['name'] + ' ' + data2[i2]['surname'];
    this.login = data2[i2]['login'];
    this.age = data2[i2]['age'] + ' years';
    this.address = data2[i2]['address'];
    this.number = data2[i2]['number'];
    print(img1);
  }

  @override
  Widget build(BuildContext context) {
    var i2;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/08.png'),
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
                    Text(nameSurname,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0)),
                    Text(login,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w100,
                          fontSize: 18,
                          color: Colors.white,
                        )),
                    Text(age,
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
                      backgroundImage: AssetImage(img1),
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
                                login,
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
                                address,
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
                                number,
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

// class MyProfileDesign extends State<ProfileDesign> {
//   var data2;
//   var i2;

//   MyProfileDesign(data, i) {
//     this.data2 = data;
//     this.i2 = i;
//   }

//   }
// }
}
