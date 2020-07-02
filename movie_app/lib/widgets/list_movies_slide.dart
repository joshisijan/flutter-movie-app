import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/pages/movie_detail.dart';


// ignore: must_be_immutable
class ListMovies extends StatelessWidget {

  final String title;
  final String sort;
  final int totalPage;

  ListMovies({
    this.title,
    this.totalPage = 4,
    this.sort = 'data_added',
  });

  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Text(
                this.title ?? '',
                style: Theme.of(context).textTheme.subtitle,
              ),
              RawMaterialButton(
                child: Text('View All'),
                onPressed: (){

                },
              ),
            ],
          ),
        ),
        Card(
          child: Container(
            height: 200.0,
            child: Stack(
              children: <Widget>[
                Container(
                  child: StreamBuilder(
                    stream: http
                        .get(
                            'https://yts.mx/api/v2/list_movies.json?sort_by=${this.sort}&limit=${this.totalPage * 2}')
                        .asStream(),
                    builder: (context, snapshot) {
                      try {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CupertinoActivityIndicator(),
                          );
                        } else {
                          if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          } else {
                            if (snapshot.data == null) {
                              return Text('data fetch error');
                            } else {
                              var data = snapshot.data.body;
                              var jsonData = jsonDecode(data);
                              if (jsonData['status'].toString() == 'ok') {
                                var data = jsonData['data'];
                                return Container(
                                  child: PageView(
                                    onPageChanged: (index){

                                    },
                                    controller: _pageController,

                                    children: List.generate(this.totalPage, (index){
                                      return Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Expanded(
                                            child: MaterialButton(
                                              child: Stack(
                                                children: <Widget>[
                                                  Container(
                                                    child: Image.network(
                                                      data['movies'][index + index]
                                                      ['medium_cover_image'],
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Positioned(
                                                    child: Container(
                                                      color: Colors.black.withOpacity(0.9),
                                                      padding: EdgeInsets.all(10),
                                                      child: Center(
                                                        child: Text(
                                                          '${data['movies'][index + index]['title']} (${data['movies'][index + index]['year']})',
                                                          style: Theme.of(context).textTheme.caption,
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                    bottom: 0.0,
                                                    right: 0.0,
                                                    left: 0.0,
                                                  ),
                                                ],
                                              ),

                                              onPressed: () {
                                                Navigator.push(context, MaterialPageRoute(
                                                  builder: (context) => MovieDetail(
                                                    movieId: data['movies'][index + index]['id'],
                                                  ),
                                                ));
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: MaterialButton(
                                              child: Stack(
                                                children: <Widget>[
                                                  Container(
                                                    child: Image.network(
                                                      data['movies'][index + index + 1]
                                                      ['medium_cover_image'],
                                                    ),
                                                  ),
                                                  Positioned(
                                                    child: Container(
                                                      color: Colors.black.withOpacity(0.9),
                                                      padding: EdgeInsets.all(10),
                                                      child: Center(
                                                        child: Text(
                                                          '${data['movies'][index + index + 1]['title']} (${data['movies'][index + index + 1]['year']})',
                                                          style: Theme.of(context).textTheme.caption,
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                    bottom: 0.0,
                                                    right: 0.0,
                                                    left: 0.0,
                                                  ),
                                                ],
                                              ),
                                              onPressed: () {
                                                Navigator.push(context, MaterialPageRoute(
                                                  builder: (context) => MovieDetail(
                                                    movieId: data['movies'][index + index + 1]['id'],
                                                  ),
                                                ));
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ),
                                );
                              } else {
                                return Text(jsonData['status'].toString() +
                                    ' : ' +
                                    jsonData['status_message'].toString());
                              }
                            }
                          }
                        }
                      } catch (e) {
                        return Text(e.toString());
                      }
                    },
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        width: 50.0,
                        child:  RawMaterialButton(
                          fillColor: Colors.black.withAlpha(100),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white70,
                          ),
                          onPressed: () {
                            if(_pageController.page > 0){
                              _pageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInCubic,
                              );
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 50.0,
                        child: RawMaterialButton(
                          fillColor: Colors.black.withAlpha(100),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white70,
                          ),
                          onPressed: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInCubic,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
      ],
    );
  }
}
