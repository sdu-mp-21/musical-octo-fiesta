import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

class Registration extends StatelessWidget {
  List data;
  String name, surname, login, password, age, address, number;

  Registration(List data) {
    this.data = data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/registration.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 90),
            child: Center(
              child: Text('Registration',
                  style: GoogleFonts.pacifico(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Name: ",
              hintText: "Enter your name",
              prefixIcon: Icon(Icons.people),
            ),
            onChanged: (name2) {
              this.name = name2;
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Surname: ",
              hintText: "Enter your surname",
              prefixIcon: Icon(Icons.people),
            ),
            onChanged: (surname2) {
              this.surname = surname2;
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Login: ",
              hintText: "Enter your login",
              prefixIcon: Icon(
                Icons.login_rounded,
              ),
            ),
            onChanged: (login2) {
              this.login = login2;
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Password: ",
              hintText: "Enter your password",
              prefixIcon: Icon(Icons.password_rounded),
            ),
            onChanged: (password2) {
              this.password = password2;
            },
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "Age: ",
                hintText: "Enter your age",
                prefixIcon: Icon(Icons.six_mp_rounded)),
            onChanged: (age) {
              this.age = age;
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Address: ",
              hintText: "Enter your address",
              prefixIcon: Icon(Icons.home),
            ),
            onChanged: (address) {
              this.address = address;
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Phone number: ",
              hintText: "Enter your number",
              prefixIcon: Icon(Icons.phone_android_rounded),
            ),
            onChanged: (number) {
              this.number = number;
            },
          ),
          SizedBox(
            height: 35,
          ),
          Center(
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
              ),
              textColor: Colors.black,
              color: Colors.white,
              onPressed: () {
                //  zhana user kosu i login pageke zhberu
              },
              child: Text('Submit'),
            ),
          )
        ]),
      ),
    );
  }
}
