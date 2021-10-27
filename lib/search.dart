import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rxdart/rxdart.dart';

Map<int, Color> color =
{
  50:Color.fromRGBO(51, 153, 255, .1),
  100:Color.fromRGBO(51, 153, 255, .2),
  200:Color.fromRGBO(51, 153, 255, .3),
  300:Color.fromRGBO(51, 153, 255, .4),
  400:Color.fromRGBO(51, 153, 255, .5),
  500:Color.fromRGBO(51, 153, 255, .6),
  600:Color.fromRGBO(51, 153, 255, .7),
  700:Color.fromRGBO(51, 153, 255, .8),
  800:Color.fromRGBO(51, 153, 255, .9),
  900:Color.fromRGBO(51, 153, 255, 1),
};

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Search',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFF)),
      home: new MyHomePage(title: 'Search',),
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
  List<Book> _items = new List();

  final subject = new PublishSubject<String>();

  bool _isLoading = false;

  void _textChanged(String text) {
    if(text.isEmpty) {
      setState((){_isLoading = false;});
      _clearList();
      return;
    }
    setState((){_isLoading = true;});
    _clearList();
    http.get(Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$text'))
        .then((response) => response.body)
        .then(jsonDecode)
        .then((map) => map["items"])
        .then((list) {list.forEach(_addBook);})
        .catchError(_onError)
        .then((e){setState((){_isLoading = false;});});
  }

  void _onError(dynamic d) {
    setState(() {
      _isLoading = false;
    });
  }

  void _clearList() {
    setState(() {
      _items.clear();
    });
  }
  void _addBook(dynamic book) {
    setState(() {
      _items.add(new Book(book["volumeInfo"]["title"], book["volumeInfo"]["imageLinks"]["smallThumbnail"]));
    });
  }

  @override
  void initState() {
    super.initState();
    subject.stream.debounceTime(new Duration(milliseconds: 600)).listen(_textChanged);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title,style: new TextStyle(color: Colors.white)),
      ),
      body: new Container(

        padding: new EdgeInsets.all(8.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new TextField(
              cursorColor: Colors.black,
              style: TextStyle(
                  color: Colors.black
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                filled: true,

                  hintText: 'Search titles, topics, or authors',
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color : const Color(0xFF000000),
                    ),
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
              onChanged: (string) => (subject.add(string)),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween  ,
              children:<Widget> [

                Text('Recent',style:TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
                Text('Clear all',style:TextStyle(
                    color: Colors.grey,
                    fontSize: 15,)),
              ],
            ),
            _isLoading? new CircularProgressIndicator(): new Container(),
            new Expanded(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                itemCount: _items.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                      child: new Padding(
                          padding: new EdgeInsets.all(8.0),
                          child: new Row(
                            children: <Widget>[
                              _items[index].url != null? new Image.network(_items[index].url): new Container(),
                              new Flexible(
                                  child:new Padding(
                                    padding: new EdgeInsets.all(20.0),
                                    child: new Text(_items[index].title, maxLines: 9),
                                  )
                              ),
                            ],
                          )
                      )
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Book {
  String title, url;
  Book(String title, String url) {
    this.title = title;
    this.url = url;
  }
}
