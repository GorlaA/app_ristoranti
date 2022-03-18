import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

//class news Crea oggetto news da mettere nel body
//Attezione ai campi all'interno di News
//FIXME NEWS non va
class News {
  const News({required this.restName});

  final String restName;
}
//contine la News
class element extends StatefulWidget{
  const element (News);

  @override
  State<StatefulWidget> createState() => _elementState();

}
//Stato di Element
class _elementState extends State<element>{

  @override
  Widget build(BuildContext context,) {
return Scaffold();
  }

}

//Main
void main() {
  runApp(const MyApp());
}

//Builder homepage
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        secondaryHeaderColor: const Color.fromARGB(2000, 250, 182, 80),
      ),
      home: const MyHomePage(
        //FIXME attenzione a News
        title: 'News',
        newsList: [
          News(restName: 'Alice'),
          News(restName: 'Pizzeria da Giovanni'),
          News(restName: 'Cracco')
        ],
      ),
    );
  }
}
//state Home Page
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,required this.title , required this.newsList}) : super(key: key);
  final String title;
  final List<News> newsList;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: AppBar(
          title:
          const Align(
            alignment: Alignment.bottomRight,
          child: Text('Benvenuto Gabriele',
            style:
                TextStyle(fontWeight: FontWeight.bold, fontFamily: 'JB Mono', fontSize: 25)
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40)
            ),
          ),
        ),
      ),*/
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.white,
        color: const Color.fromARGB(255, 250, 182, 80),
        items: const <Widget> [
          Icon(Icons.water_damage, size: 30,),
          Icon(Icons.add_location, size: 30,),
          Icon(Icons.zoom_in, size: 30,),
          Icon(Icons.account_circle, size: 30,)
        ],
      ),
      body: const CustomScrollView(
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
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40)
              )
            ),
          ),
          //FIXME COME CAZZ FUONZIONA SLIVERLIST
        ],
      ),
    );
  }
}

