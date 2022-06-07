import 'dart:html';

import 'package:app_ristoranti/Core/Firstore.dart';
import 'package:flutter/material.dart';
import 'package:app_ristoranti/App/presentation/bloc/Elementi_Home.dart';
import 'package:app_ristoranti/App/presentation/widgets/container_ristorante.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main(){
  runApp(new Home_app_page());
}

class Home_app_page extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>{

  bool reviewFlag = false;
  var reviews;

  @override
  void initState(){
    super.initState();

        ReviewService().getLatestReview('clientName', 'clientContact').then((QuerySnapshot<Document> docs){
          if(docs.document.isNotEmpty) {
            reviewFlag = true;
            reviews = docs.documents[0].data;
          }
        })

    }
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new Center(
      child: Material(
      elevation: 7.0,
      borderRadius: BorderRadius.circular(7.0),
      child: Container(
        height: 300.0,
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Reviews',
              style: TextStyle(
                  fontSize: 17
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 0.5,
              width: double.infinity,
              color: Colors.red,
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'Latest reviews',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 45.0),
            Row(
              children:<Widget> [
                reviewFlag?
              ],
            )
          ],
        ),
      ),
    ),
    )
    );
  }
}

