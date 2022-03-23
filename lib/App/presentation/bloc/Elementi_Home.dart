import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

//Barra di navigazione dinamica
class Bottom_Navigation_Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.white,
      buttonBackgroundColor: Colors.white,
      color: const Color.fromARGB(255, 250, 182, 80),
      items: const <Widget> [
        Icon(Icons.water_damage, size: 30,),
        Icon(Icons.add_location, size: 30,),
        Icon(Icons.zoom_in, size: 30,),
        Icon(Icons.account_circle, size: 30,)
      ],
    );
  }
}

//Topbar Dinamnica Schermata Home
class Top_Bar extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget> [
        SliverAppBar(
          pinned: true,
          floating: false,
          snap: false,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "Benvenuto Gabriele",
              textAlign: TextAlign.right,),
          ),
          shape:
          RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40)
              )
          ),
        ),
        //FIXME COME CAZZ FUONZIONA SLIVERLIST
      ],
    );
  }
}

class Top_Bar2 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Benvenuto Gabriele",
        textAlign: TextAlign.right,),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40)
          )
      ),
      backgroundColor: const Color.fromARGB(255, 250, 182, 80),
    );
  }
}

class Orizontal_list extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 400.0,
          color: Colors.red,
        ),
        Container(
          width: 400.0,
          color: Colors.deepPurpleAccent,
        ),
        Container(
          width: 400.0,
          color: Colors.green,
        ),
        Container(
          width: 400.0,
          color: Colors.yellow,
        ),
        Container(
          width: 400.0,
          color: Colors.orange,
        ),
      ],
    );
  }
}

class Silver_App_Bar_Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      snap: false,
      expandedHeight: 250.0,
      backgroundColor: Color.fromARGB(255, 250, 182, 80),
      shape:
      RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40)
          )
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Benvenuto Gabriele', textScaleFactor: 1),
      ),
    );
  }
}

class Silver_List extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (_, int index) {
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
              ),
            ),
            title: Text(
                'Ristorante'
            ),
            /*leading: Container(
              height: 50.0,
              width: 400,
              child:Orizontal_list(),

            ),*/
          );
        },
        childCount: 18,
      ),
    );
  }
}