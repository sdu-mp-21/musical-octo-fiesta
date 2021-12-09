import 'package:BookStore/main.dart';
import 'package:BookStore/profile_view.dart';
import 'package:BookStore/services/auth.dart';
import 'package:BookStore/services/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder(
            future: getUser(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                      child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(strokeWidth: 1.5)));
                default:
                  if (snapshot.hasError)
                    return Text('');
                  else
                    return
                      Container(
                        padding: EdgeInsets.all(8),
                        child: ListView(
                          children: [
                            Text(snapshot.data.firstName + " " + snapshot.data.lastName, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                            Text(snapshot.data.email, textAlign: TextAlign.center,  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                            ElevatedButton(onPressed: () async {
                              await setToken("");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profile()));
                            }, child: Text("Sign out"))
                          ],
                        )
                      );
              }
            }));
  }
}
