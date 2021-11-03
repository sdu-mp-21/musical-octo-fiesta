import 'package:BookStore/services/books.dart';
import 'package:BookStore/widgets/searchWidget/searchedBookWidget.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'models/book.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Search',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFF)),
      home: new MyHomePage(
        title: 'Search',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final subject = new PublishSubject<String>();
  String query = "";

  void _textChanged(String text) {
    if (text.isEmpty) {
      return;
    }
    setState(() {
      query = text;
    });
  }

  @override
  void initState() {
    super.initState();
    subject.stream
        .debounceTime(new Duration(milliseconds: 600))
        .listen(_textChanged);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        padding: new EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new TextField(
              cursorColor: Colors.black,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                ),
                contentPadding: EdgeInsets.all(14),
                prefixIcon: Icon(
                  Icons.search,
                  size: 28,
                ),
                filled: true,
                hintText: 'Search titles or authors',
                fillColor: Colors.brown.shade100.withAlpha(64),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: (string) => (subject.add(string)),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Recent',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Text('Clear all',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    )),
              ],
            ),
            Container(
                child: FutureBuilder(
                    future: getBooksByTitle(query),
                    builder: (context, projectSnap) {
                      if (!projectSnap.hasData) {
                        //print('project snapshot data is: ${projectSnap.data}');
                        return CircularProgressIndicator();
                      }

                      return Expanded(
                          child: ListView.builder(
                              padding: new EdgeInsets.all(8.0),
                              itemCount: projectSnap.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return SearchedBookWidget(
                                    projectSnap.data[index]);
                              }));
                    })),
          ],
        ),
      )),
    );
  }
}
