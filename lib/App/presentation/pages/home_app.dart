import 'package:flutter/material.dart';
import 'package:app_ristoranti/App/presentation/bloc/Elementi_Home.dart';

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
          slivers: <Widget>[
            Silver_App_Bar_Home(),
            Silver_List(),
          ],
        ),
        /*body: Container(
          margin: EdgeInsets.symmetric(vertical: 100.0),//margine dall'Alto
          height: 200.0,
          child:Orizontal_list(),
        )*/
      ),
    );
  }
}
