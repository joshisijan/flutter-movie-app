import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/pages/movie_detail.dart';

class SearchResult extends StatelessWidget {
  final String query;

  SearchResult(
    this.query,
  );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: http
          .get('https://yts.mx/api/v2/list_movies.json?query_term=$query')
          .asStream(),
      builder: (context, snapshot) {
        try {
          if (snapshot.connectionState == ConnectionState.waiting) {
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
                var dataInitial = snapshot.data.body;
                var jsonData = jsonDecode(dataInitial);
                if (jsonData['status'].toString() == 'ok') {
                  var data = jsonData['data']['movies'];
                  if (data == null) {
                    return Center(
                      child: Text('No reasult found.'),
                    );
                  } else {
                    return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.666667,
                      children: data.map<Widget>((x) {
                        return Padding(
                          padding: EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetail(
                                      movieId: x['id'],
                                    ),
                                  )
                              );
                            },
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Container(
                                    color: Colors.black.withOpacity(0.9),
                                    padding: EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(
                                        '${x['title']} (${x['year']})',
                                        style: Theme.of(context).textTheme.caption,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(x['medium_cover_image']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }
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
    );
  }
}
