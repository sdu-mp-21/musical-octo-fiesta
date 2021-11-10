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
  String username = '1';
  String password = '1';
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/book1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
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
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: "Enter your email",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.people, color: Colors.white),
                ),
                onChanged: (username2) {
                  this.username = username2;
                },
              ),
              SizedBox(
                height: 60,
              ),
              TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "Enter you password",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  onChanged: (password2) {
                    this.password = password2;
                  }),
              SizedBox(
                height: 70,
              ),
              Center(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.grey[600],
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
                  color: Colors.grey[600],
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Registration(data)));
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
