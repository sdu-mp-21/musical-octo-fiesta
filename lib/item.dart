import "package:flutter/material.dart";

class MyItemPage extends StatefulWidget {
  const MyItemPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyItemPageState createState() => new _MyItemPageState();
}

class _MyItemPageState extends State<MyItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: const Text('Item Page'),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          backgroundColor: const Color(0xFFE64A19),
          actions: <Widget>[
            // ignore: deprecated_member_use
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            )
          ]),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(30),
            height: 500,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/atomichabits.jpg',
                ),
                const Text(
                  'Atomic habits',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: deprecated_member_use
              RaisedButton(
                padding: const EdgeInsets.all(12),
                onPressed: () {},
                child: const Text(
                  'Buy',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.star),
                onPressed: () {},
                highlightColor: Colors.yellow,
                iconSize: 28,
              ),
            ],
          ),
          const Center(
            child: Text(
              '''An atomic habit is a regular practice or routine that is not only small and easy to do but is also the source of incredible power; a component of the system of compound growth.''',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 25),
            ),
          ),
          const SizedBox(
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Write the comment',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
