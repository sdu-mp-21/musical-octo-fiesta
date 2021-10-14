import "package:flutter/material.dart";

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search page'),
      ),
      body: TextField(
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Search',
            prefixIcon: Icon(Icons.search)
        ),

      ),
    );
  }
}
