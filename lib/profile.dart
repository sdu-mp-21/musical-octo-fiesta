import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Page",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        leading: const Icon(Icons.account_circle_rounded),
        elevation: 15,
        backgroundColor: const Color(0xFFE64A19),
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
                    color: Color(0xFFE64A19)),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/pctr.jpg'),
                ),
              ),
            ),
            Text("I love books"),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: null,
                  child: Text(
                    'Follow',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                TextButton(
                    onPressed: null,
                    child: Text('Message', style: TextStyle(fontSize: 25))),
              ],
            ),
            Center(
              child: ButtonBar(
                alignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'Followers 24',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
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
                      'Location UK, London',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
            Center(
                child: TextButton(
                    onPressed: null,
                    child: Text(
                      'Last feedback',
                      style: TextStyle(fontSize: 15),
                    ))),
            Center(
              child: Text(
                '''Healthy organizations employing engaged people for noble purposes are rare. When the day arrives where such organizations are the norm, authors Tamra Chandler and Laura Grealish will be entitled to much of the credit. Their book, Feedback (and other Dirty Words), addresses some of the most limiting organizational challenges by showing how to change destructive default behaviors associated with providing feedback. Their message extends to developing and sustaining healthy workplace relationships. Suggestions are backed by research and supported by lessons learned from the authors' own work experiences. Applause for the authors' '....pulling the plug on ratings, rankings and comparisons', all of which bring problems, in my opinion. I recommend the printed book and the single disc CD version.''',
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
