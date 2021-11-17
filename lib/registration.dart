import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Registration extends StatelessWidget {
  String name, surname, login, password;

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
                    this.name = name2;
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
                    this.surname = surname2;
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
                    hintText: "Enter your login",
                    prefixIcon:
                        Icon(Icons.login_rounded, color: Colors.brown[900]),
                    labelStyle: TextStyle(color: Colors.brown[900]),
                    hintStyle: TextStyle(color: Colors.brown[900]),
                  ),
                  onChanged: (login2) {
                    this.login = login2;
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
              Center(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.brown[900],
                  onPressed: () {
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
