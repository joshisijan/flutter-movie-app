import 'package:flutter/material.dart';
import 'package:movie_app/pages/about_page.dart';
import 'package:movie_app/pages/category_page.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/pages/movie_search.dart';

class MainMenu extends ModalRoute<void> {
  @override
  // TODO: implement barrierColor
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  // TODO: implement barrierDismissible
  bool get barrierDismissible => false;

  @override
  // TODO: implement barrierLabel
  String get barrierLabel => null;

  @override
  // TODO: implement maintainState
  bool get maintainState => true;

  @override
  // TODO: implement opaque
  bool get opaque => false;

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => Duration(milliseconds: 250);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
                  },
                ),
                ListTile(
                  title: Text('Search'),
                  leading: Icon(Icons.search),
                  onTap: (){
                    showSearch(
                      context: context,
                      delegate: MovieSearch(),
                    );
                  },
                ),
                ListTile(
                  title: Text('Browse by category'),
                  leading: Icon(Icons.category),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => CategoryPage(),
                    ));
                  },
                ),
                ListTile(
                  title: Text('About us'),
                  leading: Icon(Icons.help),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => AboutPage(),
                    ));
                  },
                ),
              ],
            ),
            Positioned(
              top: 50,
              right: 20,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
