import "package:flutter/material.dart";

class Item extends StatelessWidget {
  static const route = '/item';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item page'),
      ),
      body: Text('Good Luck with page'),
    );
  }
}
