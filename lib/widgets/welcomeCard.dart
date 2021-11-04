import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  final String firstName;

  const WelcomeCard({Key key, this.firstName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 200,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              image: AssetImage("assets/images/baner2.jpg"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hello, $firstName!",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      FadeAnimatedText('Which book suits your current mood?',
                          textAlign: TextAlign.center),
                      FadeAnimatedText('Action'),
                      FadeAnimatedText('Fantasy'),
                      FadeAnimatedText('Classics'),
                    ],
                    repeatForever: true,
                  )),
            ],
          ),
        ));
  }
}
