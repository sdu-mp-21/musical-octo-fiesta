import "package:flutter/material.dart";

class Search extends StatelessWidget {
  static const route = '/search';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search page'),
      ),
      body: Text('Good Luck with page'),
    );
  }
}
