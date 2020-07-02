import 'package:flutter/material.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/theme/theme.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'movie app 1.0',
      debugShowCheckedModeBanner: false,
      theme: kAppTheme,
      home: HomePage(),
    );
  }
}
