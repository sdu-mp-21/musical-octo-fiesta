import "package:flutter/material.dart";
import 'dart:convert';
import 'package:async/async.dart';
import 'package:flutter/services.dart';

class Basket extends StatefulWidget {
  const Basket({Key key}) : super(key: key);
  @override
  _MyBasket createState() => new _MyBasket();
}

class _MyBasket extends State<Basket> {
  List list;

  Future<String> readJson() async {
    final String response = await rootBundle.loadString('assets/basket.json');
    final list1 = await json.decode(response);

    setState(() {
      this.list = list1;
    });
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    this.readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/08.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios_new_sharp),
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                    ),
                  ]),
              Text(
                "Recently items",
                style: TextStyle(
                  fontFamily: 'Monteserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.0),
              Container(
                height: MediaQuery.of(context).size.height - 185.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(75.0)),
                ),
                child: Container(
                  margin: EdgeInsets.all(30),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 45.0),
                          child: Container(
                              height:
                                  MediaQuery.of(context).size.height - 300.0,
                              child: ListView(children: [
                                _buildBookItem(list[0]["imgPath"],
                                    list[0]['name'], list[0]['price']),
                                _buildBookItem(list[1]["imgPath"],
                                    list[1]['name'], list[1]['price']),
                                _buildBookItem(list[2]["imgPath"],
                                    list[2]['name'], list[2]['price']),
                                _buildBookItem(list[3]["imgPath"],
                                    list[3]['name'], list[3]['price']),
                                _buildBookItem(list[4]["imgPath"],
                                    list[4]['name'], list[4]['price']),
                              ]))),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

Widget _buildBookItem(String imgPath, String name, String price) {
  return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  child: Row(children: [
                Hero(
                    tag: imgPath,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(imgPath),
                      radius: 40,
                    )),
                SizedBox(width: 15.0),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(name,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold)),
                  Text(price,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                          color: Colors.blue))
                ])
              ])),
              IconButton(
                  icon: Icon(Icons.delete_outlined),
                  color: Colors.black,
                  onPressed: () {})
            ],
          )));
}
