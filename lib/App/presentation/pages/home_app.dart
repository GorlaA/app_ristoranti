import 'package:flutter/material.dart';
import 'package:app_ristoranti/App/presentation/bloc/Elementi_Home.dart';
import 'package:app_ristoranti/App/presentation/widgets/container_ristorante.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

void main(){
  //Oggetto firebase
  runApp(Home_app_page("Gabriele"));
}

class Home_app_page extends StatelessWidget{
  String nomeUtente = "";
  List<Ristorante> ristoranti = [];
  Color temaApp = Colors.black26;
  Home_app_page(this.nomeUtente, {Key? key}) : super(key: key){
    ristoranti = [
      Ristorante("Marcellino", "assets/images/Marcellino.jpg", 1, "Come un sarto che cuce abiti tailor made in base a gusto, personalità e esigenze, così Marcellino crea sul momento il tuo panino su misura, facendoti scegliere tra una grande varietà di ingredienti di prima scelta.",["Panino0","Panino1", "Panino2", "Panino3"], "Via Napo Torriani, 9, 20124 \nMilano MI", "Panineria", 15),
      Ristorante("Pescaria", "assets/images/Pescaria.jpg", 2, "", ["Panino0","Panino1", "Panino2"], "Via Sant'Anatalone, 16, 20147 Milano MI", "Panineria", 20),
      Ristorante("Mamma\nMilano", "assets/images/MammaMilano.jpg", 3, "", ["Panino0","Panino1", "Panino2", "Panino3"], "", "Panineria", 30),
      Ristorante("Beato te\nMilano", "assets/images/logoBeatoTe.jpg", 4, "", ["Panino0","Panino1", "Panino2", "Panino3"], "", "Ristorante", 40),
      Ristorante("PaninoLAB", "assets/images/paninolab-isola.jpg", 5, "", ["Panino0","Panino1", "Panino2", "Panino3"], "", "Panineria", 10),
    ];
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'App',
      home: Scaffold(
        backgroundColor: temaApp,
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


