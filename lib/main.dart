import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'App/presentation/bloc/Elementi_Home.dart';

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
//Fine oggetti relativi agli elementi News
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
<<<<<<< HEAD
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
=======
        primarySwatch: Colors.orange,
        secondaryHeaderColor: const Color.fromARGB(2000, 250, 182, 80),
      ),
      home: const MyHomePage(
        //FIXME attenzione a News non sicuro!
        title: 'News',
        //richiesta di oggetti di tipo news
        newsList: [
          News(restName: 'Alice'),
          News(restName: 'Pizzeria da Giovanni'),
          News(restName: 'Cracco')
        ],
>>>>>>> CheckpointLele1
      ),
    );
  }
}
//state Home Page
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,required this.title , required this.newsList}) : super(key: key);
  final String title;
  final List<News> newsList; //required nella crezione del blocco

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottom_Navigation_Bar(),
      body: Top_Bar(),
    );
  }
}

