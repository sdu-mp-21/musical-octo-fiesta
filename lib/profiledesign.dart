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
        toolbarHeight: 200,
        title: const Text(
          "@tomholland",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: const DecorationImage(
              image: AssetImage('assets/images/profilewallpaper.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevation: 15,
        backgroundColor: const Color(0xFF29B6F6),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: Container(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.all(20),
          child: CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/images/pctr.jpg'),
          ),
        ),
      ),
    );
  }
}
