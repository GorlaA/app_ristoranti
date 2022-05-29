import 'package:app_ristoranti/App/presentation/widgets/container_ristorante.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';

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
        centerTitle: true,
        title: ListTile(
          title:
            Text('App', style: TextStyle(fontSize: 40.0)),
          subtitle: Text(
              'Benvenuto Gabriele'
          ),
        ),
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

class Sliver_App_Bar_Home extends StatelessWidget{
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      onStretchTrigger: () {
        // Function callback for stretch
        return Future<void>.value();
      },
      expandedHeight: 300.0,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
        centerTitle: true,
        title: ListTile(
          title: Text('App', style: TextStyle(fontSize: 40.0)),
          subtitle: Text('Benvenuto Gabriele'),
        ),
      )
    );
  }
}

class Sliver_List extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Nome').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData) return const Text('Loading...');
          return SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(padding: EdgeInsets.all(10)),
                Container_Ristorante(new Ristorante("Marcellino", "assets/images/Marcellino.jpg", 1)),
                Padding(padding: EdgeInsets.all(10)),
                Container_Ristorante(new Ristorante("Marcellino", "assets/images/Marcellino.jpg", 4)),
                Padding(padding: EdgeInsets.all(10)),
                Container_Ristorante(new Ristorante("Marcellino", "assets/images/Marcellino.jpg", 5)),
                Padding(padding: EdgeInsets.all(10)),
                Container_Ristorante(new Ristorante("Marcellino", "assets/images/Marcellino.jpg", 3)),
                Padding(padding: EdgeInsets.all(10)),
                ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Sunday'),
                  subtitle: Text('sunny, h: 80, l: 65'),
                ),
                ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Monday'),
                  subtitle: Text('sunny, h: 80, l: 65'),
                ),
                ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Monday'),
                  subtitle: Text('sunny, h: 80, l: 65'),
                ),
                ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Monday'),
                  subtitle: Text('sunny, h: 80, l: 65'),
                ),
                ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Monday'),
                  subtitle: Text('sunny, h: 80, l: 65'),
                ),
                ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Monday'),
                  subtitle: Text('sunny, h: 80, l: 65'),
                ),
                ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Monday'),
                  subtitle: Text('sunny, h: 80, l: 65'),
                ),
                ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Monday'),
                  subtitle: Text('sunny, h: 80, l: 65'),
                ),
                // ListTiles++
              ],
            ),
          );
        },
      ),
    );
  }
}

