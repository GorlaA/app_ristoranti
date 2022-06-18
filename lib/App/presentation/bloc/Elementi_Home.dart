import 'package:app_ristoranti/App/presentation/widgets/container_ristorante.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/ristorante.dart';
import '../pages/home_app.dart';

//Barra superiore flessibile con titolo e nome utente
class Sliver_App_Bar_Home extends StatelessWidget{
  String nomeUtente = "";
  Sliver_App_Bar_Home(this.nomeUtente, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
          pinned: true,
          floating: false,
          snap: false,
          expandedHeight: 250.0,
          collapsedHeight: 80,
          backgroundColor: const Color.fromARGB(255, 250, 182, 80),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),)),
          flexibleSpace: FlexibleSpaceBar(centerTitle: true, title: ListTile(title: Text("Top food", style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),), subtitle: Text('Benvenuto '+nomeUtente),)),
    );
  }
}
//Widget per la creazione di una lista di ristoranti nominata
class ListaRistoranti extends StatefulWidget{
  final String nome;
  final List<Ristorante> ristoranti;
  ListaRistoranti(this.nome, this.ristoranti);

  @override
  _ListaRistorantiState createState() => _ListaRistorantiState(this.ristoranti, nome);
}
class _ListaRistorantiState extends State<ListaRistoranti>{
  List<Ristorante> ristoranti;
  String nome;
  _ListaRistorantiState(this.ristoranti, this.nome);
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Container(child: Text(nome, style: const TextStyle(color: Colors.lightBlueAccent, fontSize: 30), textAlign: TextAlign.center), margin: EdgeInsets.all(10)),
          for (var element in ristoranti) Container_Ristorante(element)
        ],
      ),
    );
  }
}
