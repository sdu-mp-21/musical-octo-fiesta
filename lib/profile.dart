import "package:flutter/material.dart";

class Profile extends StatelessWidget {
  static const route = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile page'),
      ),
      body: Text('Good Luck with page'),
    );
  }
}
