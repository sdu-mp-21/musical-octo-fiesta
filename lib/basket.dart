import "package:flutter/material.dart";
import 'main.dart';

class Basket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Error'),
        content: const Text('Your basket is empty!!!'),
        actions: [
          FlatButton(
              child: Text('ok'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              })
        ]);
  }
}
