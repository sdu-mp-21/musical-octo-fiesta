import 'package:BookStore/main.dart';
import 'package:BookStore/services/auth.dart';
import 'package:BookStore/view/home_view.dart';
import 'package:BookStore/view/registration_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Password extends StatelessElement {
  Password(StatelessWidget widget) : super(widget);
  var _password = TextEditingController();

  @override
  Widget build() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 35,
              ),
              Text(
                'Reset password',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 50.0,
                    color: Colors.blue),
              ),
              SizedBox(
                height: 95,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Repeat the password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
