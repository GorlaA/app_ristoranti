import 'package:flutter/material.dart';
import 'package:app_ristoranti/App/presentation/bloc/Elementi_Home.dart';
import 'package:app_ristoranti/App/presentation/widgets/container_ristorante.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main(){
  //Oggetto firebase
  runApp(Home_app_page("Gabriele"));
}

class Home_app_page extends StatelessWidget{
  String nomeUtente = "";
  List<Ristorante> ristoranti = [];
  Home_app_page(this.nomeUtente, {Key? key}) : super(key: key){
    ristoranti = [
      Ristorante("Marcellino", "assets/images/Marcellino.jpg", 1),
      Ristorante("Marcellino", "assets/images/Marcellino.jpg", 2),
      Ristorante("Marcellino", "assets/images/Marcellino.jpg", 3),
      Ristorante("Marcellino", "assets/images/Marcellino.jpg", 4),
      Ristorante("Marcellino", "assets/images/Marcellino.jpg", 5),
    ];
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'App',
      home: Scaffold(
        bottomNavigationBar: Bottom_Navigation_Bar(),
        body: CustomScrollView(
          slivers: <Widget>[//lista di figli
            Sliver_App_Bar_Home(nomeUtente),
            ListaRistoranti("In evidenza", ristoranti),
            ListaRistoranti("Nelle vicinanze", ristoranti)
          ],
        ),
      ),
    );
  }
}
