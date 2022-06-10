import 'dart:core';
import 'package:app_ristoranti/App/presentation/pages/home_app.dart';
import 'package:flutter/material.dart';
import 'package:app_ristoranti/App/presentation/bloc/Elementi_Home.dart';
import 'package:app_ristoranti/App/presentation/widgets/container_ristorante.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:app_ristoranti/App/presentation/pages/ristorante.dart';
class User {
  String nome;
  String cognome;
  String foto;
  String mail;
  String citta;
  User(this.nome, this.cognome, this.mail, this.foto, this.citta);

  get getNome => nome;
  get getCognome => cognome;
  get getMail => mail;
  get getFoto => foto;
}

class ProfilePage extends StatelessWidget{
  User user;
  ProfilePage(this.user);

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
        color: Color.fromARGB(255, 250, 182, 80),
        child: Container(color: Colors.black, child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [Container(constraints: const BoxConstraints.expand(height: 200.0, width: 200), padding: const EdgeInsets.all(10), margin: const EdgeInsets.all(10), decoration: const ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0),),), color: Colors.black,), child: ClipRRect(borderRadius: BorderRadius.circular(90), child: Image.asset(user.foto,fit: BoxFit.fill,)),)],),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [subTitles("Nome", Color.fromARGB(255, 250, 182, 80)),],),
            Padding(padding: EdgeInsets.only(top: 5)),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [subTitlesLower(user.nome, Colors.lightBlueAccent)]),
            Padding(padding: EdgeInsets.only(top: 20)),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [subTitles("Cognome", Color.fromARGB(255, 250, 182, 80)),],),
            Padding(padding: EdgeInsets.only(top: 5)),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [subTitlesLower(user.cognome, Colors.lightBlueAccent)]),
            Padding(padding: EdgeInsets.only(top: 20)),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [subTitles("Mail", Color.fromARGB(255, 250, 182, 80)),],),
            Padding(padding: EdgeInsets.only(top: 5)),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [subTitlesLower(user.mail, Colors.lightBlueAccent)]),
            Padding(padding: EdgeInsets.only(top: 20)),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [subTitles("Città", Color.fromARGB(255, 250, 182, 80)),],),
            Padding(padding: EdgeInsets.only(top: 5)),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [subTitlesLower(user.citta, Colors.lightBlueAccent)]),
          ],
        ),)
    );
  }

}

Widget subTitles(String text, Color color){
  return Row(children: [Padding(padding: EdgeInsets.only(left: 5)),Text(text,textAlign: TextAlign.left, style: TextStyle(color: color, fontSize: 30, fontWeight: FontWeight.bold)),],);
}
Widget subTitlesLower(String text, Color color){
  return Row(children: [Padding(padding: EdgeInsets.only(left: 5, top: 5)),Text(text,textAlign: TextAlign.left, style: TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.normal)),],);
}