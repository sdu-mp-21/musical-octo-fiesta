import 'package:flutter/material.dart';

class ProfileDesign extends StatefulWidget {
  const ProfileDesign({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyProfileDesign createState() => new _MyProfileDesign();
}

class _MyProfileDesign extends State<ProfileDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "@tomholland",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        leading: const Icon(Icons.account_circle_rounded),
        elevation: 15,
        backgroundColor: const Color(0xFF80DEEA),
        actions: const [Icon(Icons.more_vert)],
      ),
    );
  }
}
