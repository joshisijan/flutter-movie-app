import 'package:flutter/material.dart';
import 'package:movie_app/app_base.dart';


class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBase(
      title: 'About us',
      child: ListView(
        children: <Widget>[
          Text('about us'),
        ],
      ),
    );
  }
}
