import "package:flutter/material.dart";

class MyItemPage extends StatefulWidget {
  const MyItemPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyItemPageState createState() => new _MyItemPageState();
}

Widget _bookWidget({title, author, rating, page}) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: SizedBox(
      width: 100,
      height: 50,
      child: Row(
        children: [
          Container(
            child: Text(page,
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center),
            width: 50,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  topLeft: Radius.circular(5)),
            ),
          ),
          Container(
            child: Text(
              rating,
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            width: 50,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  topLeft: Radius.circular(5)),
            ),
          ),
        ],
      ),
    ),
  );
}

class _MyItemPageState extends State<MyItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: Center(child: const Text('Why We Sleep')),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          backgroundColor: Colors.blue.shade500,
          actions: <Widget>[
            // ignore: deprecated_member_use
            IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {},
            )
          ]),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Container(
                      child: Image.asset(
                    'assets/images/why.jpg',
                    width: 180,
                    height: 200,
                  )),
                  Center(
                    child: Row(
                      children: [
                        _bookWidget(
                            title: "Why We Sleep",
                            author: "Matthew Walker",
                            rating: "7.8",
                            page: "340"),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    child: Text('Description',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            fontStyle: FontStyle.italic)),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    child: Text(
                      '''Sleep is one of the most important but least understood aspects of our life, wellness, and longevity. Until very recently, science had no answer to the question of why we sleep, or what good it served, or why we suffer such devastating health consequences when we don't sleep. Compared to the other basic drives in life—eating, drinking, and reproducing—the purpose of sleep remained elusive.''',
                      textAlign: TextAlign.justify,
                      style:
                          TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite,
                                color: Colors.redAccent),
                            onPressed: () {},
                            iconSize: 35,
                          ),
                          RaisedButton(
                            onPressed: () {},
                            child: Text(
                              "Add to card",
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                            color: Colors.blue[100],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
