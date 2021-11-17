import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'profiledesign.dart';
import 'registration.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);
  @override
  _MyProfile createState() => new _MyProfile();
}

class _MyProfile extends State<Profile> {
  String username = '';
  String password = '';
  List data;

  Future<String> readJson() async {
    final String response = await rootBundle.loadString('assets/users.json');
    final data2 = await json.decode(response);

    setState(() {
      this.data = data2;
    });
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    this.readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 90),
                child: Center(
                  child: Text('Log In',
                      style: GoogleFonts.pacifico(
                        textStyle: TextStyle(
                          color: Colors.brown[900],
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 350.0,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.brown[900]),
                    hintText: "Enter your email",
                    hintStyle: TextStyle(color: Colors.brown[900]),
                    prefixIcon: Icon(Icons.people, color: Colors.brown[900]),
                  ),
                  onChanged: (username2) {
                    this.username = username2;
                  },
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                width: 350.0,
                child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      hintText: "Enter you password",
                      labelStyle: TextStyle(color: Colors.brown[900]),
                      prefixIcon: Icon(Icons.lock, color: Colors.brown[900]),
                      hintStyle: TextStyle(color: Colors.brown[900]),
                    ),
                    onChanged: (password2) {
                      this.password = password2;
                    }),
              ),
              SizedBox(
                height: 70,
              ),
              Center(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.brown[900],
                  onPressed: () {
                    if (username.length < 3 || password.length < 5) {
                      Alert2(context);
                    }

                    for (int i = 0; i < data.length; i++) {
                      if (data[i]['login'] == username &&
                          data[i]['password'] == password) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfileDesign(data, i)));
                      }
                    }
                  },
                  child: Text('LOGIN'),
                ),
              ),
              Center(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.brown[900],
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Registration()));
                    // zhana registration page ashu
                  },
                  child: Text('Registration'),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

Future Alert2(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Invalid username or password!'),
        content: const Text('Please, write again.'),
        actions: [
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
