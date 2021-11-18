import 'package:BookStore/models/user.dart';
import 'package:BookStore/services/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

class Registration extends StatefulWidget {
  const Registration({Key key}) : super(key: key);
  @override
  _Registration createState() => new _Registration();
}

class _Registration extends State<Registration> {
  String firstName, lastName, email, password;
  User _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 70),
                child: Center(
                  child: Text('Registration',
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
                height: 30,
              ),
              Container(
                width: 350.0,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name: ",
                    hintText: "Enter your name",
                    prefixIcon: Icon(Icons.people, color: Colors.brown[900]),
                    labelStyle: TextStyle(color: Colors.brown[900]),
                    hintStyle: TextStyle(color: Colors.brown[900]),
                  ),
                  onChanged: (name2) {
                    this.firstName = name2;
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 350.0,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Surname: ",
                    hintText: "Enter your surname",
                    prefixIcon: Icon(Icons.people, color: Colors.brown[900]),
                    labelStyle: TextStyle(color: Colors.brown[900]),
                    hintStyle: TextStyle(color: Colors.brown[900]),
                  ),
                  onChanged: (surname2) {
                    this.lastName = surname2;
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 350.0,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email: ",
                    hintText: "Enter your email",
                    prefixIcon:
                        Icon(Icons.login_rounded, color: Colors.brown[900]),
                    labelStyle: TextStyle(color: Colors.brown[900]),
                    hintStyle: TextStyle(color: Colors.brown[900]),
                  ),
                  onChanged: (login2) {
                    this.email = login2;
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 350.0,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password: ",
                    hintText: "Enter your password",
                    prefixIcon:
                        Icon(Icons.password_rounded, color: Colors.brown[900]),
                    labelStyle: TextStyle(color: Colors.brown[900]),
                    hintStyle: TextStyle(color: Colors.brown[900]),
                  ),
                  onChanged: (password2) {
                    this.password = password2;
                  },
                ),
              ),
              SizedBox(
                height: 35,
              ),
              _user == null
                  ? Container()
                  : Text(
                      "The user ${_user.firstName}, ${_user.lastName} is created successfully"),
              Center(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.brown[900],
                  onPressed: () async {
                    await createUser(firstName, lastName, email, password);

                    // setState(() {
                    //   _user = user2;
                    // });
                    //  zhana user kosu i login pageke zhberu
                  },
                  child: Text('Submit'),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
