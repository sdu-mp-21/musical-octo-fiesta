import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  final String firstName;

  const WelcomeCard({Key key, this.firstName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              image: AssetImage("assets/images/08.png"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hello, $firstName!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Which book suits your current mood?",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
