import 'dart:ui';

import 'package:BookStore/services/books.dart';
import "package:flutter/material.dart";
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'item_view.dart';

class Books extends StatefulWidget {
  Books(
      {Key key, this.title, this.selected, this.pageController, this.callback})
      : super(key: key);
  final int selected;
  final PageController pageController;
  final Function callback;

  final String title;

  @override
  _MyBook createState() => new _MyBook();
}

class _MyBook extends State<Books> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  Widget _addItem() {
    final double defMargin = 30;
    final double defStart = 250;
    final double defEnd = defStart / 2;

    double bottom = defMargin;
    double scale = 1.0;

    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      bottom -= offset;
      if (offset < defStart - defEnd) {
        scale = 1.0;
      } else if (offset < defStart - defEnd) {
        scale = (defMargin - defEnd - offset);
      } else {
        scale = 0.0;
      }
    }

    return Positioned(
      bottom: bottom,
      right: 16,
      child: FloatingActionButton(
        backgroundColor: Colors.orange.shade100,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getAllBooks(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            }
            return Container(
                child: Stack(children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: <Widget>[
                  SliverAppBar(
                    actions: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: IconButton(
                            icon: Icon(
                              Icons.tune,
                            ),
                            onPressed: () {},
                          ))
                    ],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                    ),
                    backgroundColor: Colors.orange.shade100,
                    expandedHeight: 150,
                    pinned: true,
                  ),
                  SliverFillRemaining(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Stack(
                        children: [
                          StaggeredGridView.countBuilder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            crossAxisCount: 4,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) =>
                                BookItem(snapshot.data[index]),
                            staggeredTileBuilder: (_) =>
                                const StaggeredTile.fit(2),
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              _addItem(),
            ]));
          }),
    );
  }
}
