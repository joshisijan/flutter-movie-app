import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListMoviesTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: http.get('https://yts.mx/api/v2/list_movies.json/').asStream(),
      builder: (context, snapshot){
        try{
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }else{
            if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }else{
              if(snapshot.data == null){
                return Text('data fetch error');
              }else{
                var data = snapshot.data.body;
                var jsonData = jsonDecode(data);
                if(jsonData['status'].toString() == 'ok'){
                  return Text('ok');
                }else{
                  return Text(jsonData['status'].toString() + ' : ' + jsonData['status_message'].toString());
                }
              }
            }
          }
        }catch(e){
          return Text(e.toString());
        }
      },
    );
  }
}
