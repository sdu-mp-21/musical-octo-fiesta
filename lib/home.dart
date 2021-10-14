import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const route = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Book",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
            ),
            Image.asset('assets/images/baner.png'),
          ],
        ),
      ),
    );
  }
}
