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
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Tom Holland",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/pctr.jpg'),
                ),
              ),
            ),
            Text("I love books"),
            Center(
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'Books 136',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      '24 y.o.',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
