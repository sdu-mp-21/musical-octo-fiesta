import 'package:BookStore/bookpage.dart';
import 'package:BookStore/books.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<Home> {
  int currentGenre = 0;
  List<String> genres = [
    "All",
    "Fantasy",
    "Mistery",
    "Action and Adventure",
    "Classics",
    "Historical Fiction"
  ];

  Widget _welcomeWidget(String firstName) {
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

  Widget _bookWidget({title, author, rating, image}) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookPage()),
          );
        },
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Stack(children: [
              SizedBox(
                  width: 120,
                  height: 230,
                  child: Column(children: [
                    Container(
                      height: 180,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                            image: NetworkImage(image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    Text(author,
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w600))
                  ])),
              Positioned(
                  top: 10,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade500,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        Text(
                          rating,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  )),
            ])));
  }

  Widget _categoryWidget({String label, int index}) {
    bool isSelected = index == currentGenre;
    return GestureDetector(
        onTap: () => setState(() {
              currentGenre = index;
            }),
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(right: 10),
          child: Text(
            label,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black54,
                fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 1.0,
                  color: !isSelected
                      ? Color.fromRGBO(0, 0, 0, 0.1)
                      : Colors.transparent),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(isSelected ? 0.2 : 0),
                  spreadRadius: 4,
                  blurRadius: 5,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ]),
        ));
  }

  Widget _showMoreWidget() {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Books()),
          );
        },
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade500,
                      borderRadius: BorderRadius.circular(18)),
                  alignment: Alignment.center,
                  child: HeroIcon(HeroIcons.arrowRight, color: Colors.white),
                ),
                SizedBox(height: 4),
                Text("Показать все",
                    style: TextStyle(fontWeight: FontWeight.w500))
              ],
            )));
  }

  Widget _buildBody() {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        _welcomeWidget("Tom"),
        Container(
            height: 60,
            child: ListView(
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  for (var i = 0; i < genres.length; i++)
                    _categoryWidget(label: genres[i], index: i)
                ])),
        Container(
            height: 246,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                _bookWidget(
                    author: "Matthew Walker",
                    title: "Why We Sleep",
                    rating: "7.8",
                    image:
                        "https://m.media-amazon.com/images/I/51WOq1TRGdL.jpg"),
                _showMoreWidget()
              ],
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: FutureBuilder(builder: (context, snapshot) {
      // if (!snapshot.hasData) {
      //   // Future hasn't finished yet, return a placeholder
      //   return Center(child: Text('Loading...'));
      // }
      return _buildBody();
    }));
  }
}
