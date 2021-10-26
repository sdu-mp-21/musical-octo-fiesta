import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

Widget welcomeWidget(String firstName) {
  return Container(
      padding: EdgeInsets.all(10),
      child: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              image: AssetImage("assets/images/08.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(40),
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
          ),
        ),
        borderRadius: BorderRadius.circular(14),
      ));
}

Widget bookWidget() {
  return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
          width: 120,
          height: 200,
          child: Column(children: [
            Container(
              height: 200,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://simg.marwin.kz/media/catalog/product/cache/8d1771fdd19ec2393e47701ba45e606d/2/2/22150614-uval-noy-harari-sapiens-kratkaya-istoriya-chelovechestva.jpg_330.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ]),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "The Popply War",
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            Text("R.F. Kuang",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w600))
          ])));
}

Widget categoryWidget({String label, bool isSelected: false}) {
  return Container(
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
  );
}

Widget _buildBody() {
  return ListView(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    children: [
      welcomeWidget("Maira"),
      Container(
          height: 60,
          child: ListView(
            padding: EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              categoryWidget(label: "Fantasy", isSelected: true),
              categoryWidget(label: "Romance"),
              categoryWidget(label: "Mystery"),
              categoryWidget(label: "Action and Adventure"),
              categoryWidget(label: "Classics"),
              categoryWidget(label: "Historical Fiction"),
            ],
          )),
      Container(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              bookWidget(),
              bookWidget(),
              bookWidget(),
              bookWidget(),
              bookWidget(),
            ],
          )),
    ],
  );
}

class _HomeWidgetState extends State<Home> {
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
