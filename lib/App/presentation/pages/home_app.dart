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
      title: 'App',
      home: Scaffold(
        bottomNavigationBar: Bottom_Navigation_Bar(),
        /*appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child:
        ),*/
        body: CustomScrollView(
          slivers: <Widget>[//lista di figli
            Silver_App_Bar_Home(),
            //Silver_List(),
            //Sliver_App_Bar_Home(),
            Sliver_List(),
          ],
        ),
      ),
    );
  }
}
