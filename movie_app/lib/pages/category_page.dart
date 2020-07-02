import 'package:flutter/material.dart';
import 'package:movie_app/app_base.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBase(
      title: 'Categories',
      child: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          GridMenu(
            image: 'https://upload.wikimedia.org/wikipedia/en/b/b9/Hangoverposter09.jpg',
            title: 'Comedy',
            click: (){

            },
          ),
          GridMenu(
            image: 'https://upload.wikimedia.org/wikipedia/en/a/af/Star_Wars_The_Rise_of_Skywalker_poster.jpg',
            title: 'Sci-Fi',
            click: (){

            },
          ),
          GridMenu(
            image: 'https://upload.wikimedia.org/wikipedia/en/4/47/Orphanposter.jpg',
            title: 'Horror',
            click: (){

            },
          ),
          GridMenu(
            image: 'https://upload.wikimedia.org/wikipedia/en/8/86/Posternotebook.jpg',
            title: 'Romance',
            click: (){

            },
          ),
          GridMenu(
            image: 'https://upload.wikimedia.org/wikipedia/en/e/e1/MissionImpossiblePoster.jpg',
            title: 'Action',
            click: (){

            },
          ),
          GridMenu(
            image: 'https://upload.wikimedia.org/wikipedia/en/8/86/The_Silence_of_the_Lambs_poster.jpg',
            title: 'Thriller',
            click: (){

            },
          ),
          GridMenu(
            image: 'https://upload.wikimedia.org/wikipedia/en/a/a6/Once_Upon_a_Time_in_Hollywood_poster.png',
            title: 'Drama',
            click: (){

            },
          ),
          GridMenu(
            image: 'https://upload.wikimedia.org/wikipedia/en/a/ae/Men_Who_Hate_Women.jpg',
            title: 'Mystery',
            click: (){

            },
          ),
          GridMenu(
            image: 'https://upload.wikimedia.org/wikipedia/en/6/68/Seven_%28movie%29_poster.jpg',
            title: 'Crime',
            click: (){

            },
          ),
          GridMenu(
            image: 'https://upload.wikimedia.org/wikipedia/en/4/4f/Frozen_2_poster.jpg',
            title: 'Animation',
            click: (){

            },
          ),
          GridMenu(
            image: 'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Center_of_the_earth_3d.jpg/220px-Center_of_the_earth_3d.jpg',
            title: 'Adventure',
            click: (){

            },
          ),
          GridMenu(
            image: 'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Lord_of_the_Rings_The_Fellowship_of_the_Ring_%282001%29.jpg',
            title: 'Fantasy',
            click: (){

            },
          ),
          GridMenu(
            image: 'https://upload.wikimedia.org/wikipedia/en/e/ee/You%27ve_Got_Mail.jpg',
            title: 'Comedy-Romance',
            click: (){

            },
          ),
          GridMenu(
            image: 'https://upload.wikimedia.org/wikipedia/en/2/23/Deadpool_%282016_poster%29.png',
            title: 'Action-Comedy',
            click: (){

            },
          ),
          GridMenu(
            image: 'https://upload.wikimedia.org/wikipedia/en/0/0d/Avengers_Endgame_poster.jpga',
            title: 'Superhero',
            click: (){

            },
          ),
        ],
      ),
    );
  }
}


class GridMenu extends StatelessWidget {

  final String title;
  final String image;
  final Function click;

  GridMenu({
    this.title,
    this.image,
    this.click,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RawMaterialButton(
        onPressed: this.click ?? (){ },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(this.image ?? ''),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.black.withAlpha(150),
            child: Center(
              child: Text(this.title),
            ),
          ),
        ),
      ),
    );
  }
}
