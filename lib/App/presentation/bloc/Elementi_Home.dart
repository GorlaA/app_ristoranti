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
           title: Text("Benvenuto Gabriele", textAlign: TextAlign.right,),
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