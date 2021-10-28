import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:async/async.dart';
import 'main.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);
  @override
  _MyProfile createState() => new _MyProfile();
}

class _MyProfile extends State<Profile> {
  String username;
  String password;
  List data;

  Future<List> readJson() async {
    final String response = await rootBundle.loadString('assets/users.json');
    final data2 = await json.decode(response);
    setState(() {
      this.data = data2;
      return data;
      // print(data);
    });
  }

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
                ),
                onChanged: (username2) {
                  this.username = username2;
                  // print(username);
                },
              ),
              SizedBox(
                height: 60,
              ),
              TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Password",
                    hintText: "Enter you password",
                  ),
                  onChanged: (password2) {
                    this.password = password2;
                    // print(password);
                  }),
              SizedBox(
                height: 70,
              ),
              Center(
                child: RaisedButton(
                  color: Colors.white, // background
                  textColor: Colors.blue, // foreground
                  onPressed: () {
                    // readJson();
                    if (username.length < 3 || password.length < 5) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                    }
                    readJson();
                  },
                  child: Text('LOGIN'),
                ),
              )
            ])));
  }
}
