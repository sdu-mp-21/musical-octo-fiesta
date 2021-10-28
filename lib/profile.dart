import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);
  @override
  _MyProfile createState() => new _MyProfile();
}

class _MyProfile extends State<Profile> {
  var username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.cyan[500],
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 90),
                child: Center(
                  child: Text('Log In',
                      style: GoogleFonts.pacifico(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                  decoration: InputDecoration(
                labelText: "Username",
                hintText: "Enter your email",
                prefixIcon: Icon(Icons.people),
              )),
              SizedBox(
                height: 60,
              ),
              TextField(
                  decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: "Password",
                hintText: "Enter you password",
              )),
              SizedBox(
                height: 70,
              ),
            ])));
  }
}
