import 'package:flutter/material.dart';
import 'package:movie_app/pages/main_menu.dart';
import 'package:movie_app/pages/movie_search.dart';

class AppBase extends StatelessWidget {

  final Widget child;
  final String title;

  AppBase({
    this.child,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title ?? ''),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MainMenu());
          },
          icon: Icon(Icons.menu),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate:  MovieSearch(),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: this.child ?? Container(),
    );
  }
}
