import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main(){
  runApp(new Home_app_page());
}

class Home_app_page extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'App',
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBarApp(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: TopBarApp(),
        ),
      ),
    );
  }
}

class TxtBox extends StatelessWidget {
  @override
  final String name;
  final Color colore;
  const TxtBox(this.name, this.colore);
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration (color: colore),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('App ristoranti'),
      ),
    );
  }
}

class BottomNavigationBarApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.white,
          color: Color.fromARGB(2000, 250, 182, 80),
          items: <Widget>[
            Icon(Icons.water_damage, size: 30,),
            Icon(Icons.add_location, size: 30,),
            Icon(Icons.zoom_in, size: 30,),
            Icon(Icons.account_circle, size: 30,)
          ],
        );
  }
}

class TopBarApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Nome App',
      ),
      titleTextStyle: TextStyle(height: 10, fontSize: 20, color: Colors.black),
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(60))),
      shape: ContinuousRectangleBorder(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60.0),
        ),
      ),
      backgroundColor: Color.fromARGB(2000, 250, 182, 80),
    );
  }
}
