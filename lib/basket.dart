import "package:flutter/material.dart";

class Basket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Error'),
        content: Text('Your basket is empty!!!'),
        actions: [
          TextButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop())
        ]);
  }
}
