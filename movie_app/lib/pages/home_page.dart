import 'package:flutter/material.dart';
import 'package:movie_app/widgets/list_movies_slide.dart';
import 'package:movie_app/app_base.dart';


class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return AppBase(
      title: 'Home',
      child: ListView(
        children: <Widget>[
          ListMovies(
            title: 'NEW',
            sort: 'year',
            totalPage: 6,
          ),
          ListMovies(
            title: 'POPULAR',
            sort: 'most_downloaded',
            totalPage: 6,
          ),
          ListMovies(
            title: 'HIGH RATED',
            sort: 'rating',
            totalPage: 6,
          ),
        ],
      ),
    );
  }
}
