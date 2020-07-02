import 'dart:convert';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/widgets/movie_suggestion.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetail extends StatefulWidget{
  final int movieId;

  MovieDetail({
    @required this.movieId,
  });

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail>  with SingleTickerProviderStateMixin{

  TabController _tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: http.get(
          'https://yts.mx/api/v2/movie_details.json?movie_id=${this.widget.movieId}'),
      builder: (context, snapshot) {
        try {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          } else {
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(child: Text(snapshot.error.toString())),
              );
            } else {
              if (snapshot.data == null) {
                return Scaffold(
                  body: Center(child: Text('data fetch error')),
                );
              } else {
                var allData = snapshot.data.body;
                var jsonData = jsonDecode(allData);
                if (jsonData['status'].toString() == 'ok') {
                  var data = jsonData['data']['movie'];
                  return Scaffold(
                    appBar: AppBar(),
                    body: ListView(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                data['title_long'].toString(),
                                style: Theme.of(context).textTheme.title,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: FadeInImage(
                                      image: NetworkImage(
                                          data['large_cover_image']),
                                      placeholder: NetworkImage(
                                          data['medium_cover_image']),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: DescExpansionPanel(
                                        body:
                                            data['description_full'].toString(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Wrap(
                                          alignment: WrapAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Genres: ',
                                              style: TextStyle().copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              data['genres'].toString() ?? '',
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Wrap(
                                          alignment: WrapAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Rating: ',
                                              style: TextStyle().copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              data['rating'].toString() ?? '',
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Wrap(
                                          alignment: WrapAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Language: ',
                                              style: TextStyle().copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              data['language'] ?? '',
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Wrap(
                                          alignment: WrapAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Year: ',
                                              style: TextStyle().copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              data['year'].toString() ?? '',
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Wrap(
                                          alignment: WrapAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Runtime: ',
                                              style: TextStyle().copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              data['runtime'].toString() +
                                                      ' mins' ??
                                                  '',
                                            ),
                                          ],
                                        ),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        data['yt_trailer_code'] != ''
                                            ? RawMaterialButton(
                                                child: Text('View Trailer'),
                                                fillColor: Theme.of(context)
                                                    .errorColor,
                                                onPressed: () {
                                                  _ytTrailer(
                                                      data['yt_trailer_code']);
                                                },
                                              )
                                            : SizedBox(),
                                        data['imdb_code'] != ''
                                            ? RawMaterialButton(
                                                child: Text(
                                                  'imdb',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                fillColor: Color(0xfff5c518),
                                                onPressed: () {
                                                  _imdbLink(data['imdb_code']);
                                                },
                                              )
                                            : SizedBox(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              Container(
                                width: double.maxFinite,
                                child: Text(
                                  'Download Option',
                                  textAlign: TextAlign.center,
                                  style: TextStyle().copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                width: double.maxFinite,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: data['torrents'].map<Widget>((x) {
                                    return RawMaterialButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(data['title_long']
                                                    .toString()),
                                                content: Text(
                                                    'The torrent file will be download and can be opened with torrent downloader to download the movie.'),
                                                actions: <Widget>[
                                                  RawMaterialButton(
                                                    child: Text(
                                                      'Download',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      _torrent(x['url']);
                                                    },
                                                    fillColor: Colors.blue,
                                                  ),
                                                  RawMaterialButton(
                                                    child: Text(
                                                      'Cancle',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    fillColor: Theme.of(context)
                                                        .errorColor,
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        padding: EdgeInsets.all(1.0),
                                        color: Colors.green,
                                        child: ListTile(
                                          dense: true,
                                          title: Text(
                                            x['quality'].toString() +
                                                ' (' +
                                                x['type'].toString() +
                                                ')',
                                            textAlign: TextAlign.center,
                                          ),
                                          subtitle: Text(
                                            'size: ' +
                                                x['size'] +
                                                '\n' +
                                                'seed: ' +
                                                x['seeds'].toString() +
                                                '\n' +
                                                'peers: ' +
                                                x['peers'].toString(),
                                          ),
                                          leading:
                                              Icon(Icons.insert_drive_file),
                                          trailing: Icon(Icons.file_download),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Divider(),
                              Container(
                                width: double.maxFinite,
                                child: Text(
                                  'Suggested movies',
                                ),
                              ),
                              Divider(),
                              Container(
                                child: TabBar(
                                  controller: _tabController,
                                  tabs: <Widget>[
                                    Tab(
                                      child: Text('Suggestions'),
                                    ),
                                    Tab(
                                      child: Text('Review'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 440,
                                child: TabBarView(
                                  controller: _tabController,
                                  children: <Widget>[
                                    MovieSuggestion(
                                      movieId: this.widget.movieId,
                                    ),
                                    Text('sijan'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Scaffold(
                    body: Center(
                      child: Text(jsonData['status'].toString() +
                          ' : ' +
                          jsonData['status_message'].toString()),
                    ),
                  );
                }
              }
            }
          }
        } catch (e) {
          return Scaffold(
            body: Center(child: Text(e.toString())),
          );
        }
      },
    );
  }

  _torrent(String x) async {
    String url = x;
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'could not launch $url';
    }
  }

  _ytTrailer(String x) async {
    String url = 'https://www.youtube.com/watch?v=' + x;
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'could not launch $url';
    }
  }

  _imdbLink(String x) async {
    String url = 'https://www.imdb.com/title/' + x;
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'could not launch $url';
    }
  }
}

class DescExpansionPanel extends StatefulWidget {
  final String body;

  const DescExpansionPanel({this.body});

  @override
  _DescExpansionPanelState createState() => _DescExpansionPanelState();
}

class _DescExpansionPanelState extends State<DescExpansionPanel> {
  bool _descExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (_, __) {
        setState(() {
          _descExpanded = !_descExpanded;
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (_, __) {
            return ListTile(
              title: Text(
                'Description',
                style: Theme.of(context).textTheme.caption,
              ),
              dense: true,
            );
          },
          body: ListTile(
            subtitle: Text(
              this.widget.body ?? '',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          canTapOnHeader: true,
          isExpanded: _descExpanded,
        ),
      ],
    );
  }
}
