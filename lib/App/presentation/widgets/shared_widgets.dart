import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/home_app.dart';

class TopBarPage extends StatelessWidget{
  String titolo;
  TopBarPage(this.titolo);
  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        decoration: ShapeDecoration(
          color: Color.fromARGB(255, 250, 182, 80),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0),
            ),
          ),
        ),
        child: Padding(padding:EdgeInsets.only(left: 35, bottom: 0, top: 20) ,child: Text(titolo,textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold)),),
      );
  }
}

//Barra di navigazione dinamica
class Bottom_Navigation_Bar extends StatelessWidget {
  Color temaApp = Colors.black;
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: temaApp,
      buttonBackgroundColor: Colors.lightBlueAccent,
      color: const Color.fromARGB(255, 250, 182, 80),
      items: const <Widget> [
        Icon(Icons.home, color: Colors.black, size: 30,),
        Icon(Icons.location_on, color: Colors.black, size: 30,),
        Icon(Icons.search, color: Colors.black, size: 30,),
        Icon(Icons.account_circle, color: Colors.black, size: 30,),
      ],
      onTap: (index) {
        print(index);
        Provider.of<PageProvider>(context, listen: false).changePage(index);
      },
    );
  }
}