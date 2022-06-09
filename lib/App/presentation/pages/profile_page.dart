import 'dart:core';
import 'package:app_ristoranti/App/presentation/pages/home_app.dart';
import 'package:flutter/material.dart';
import 'package:app_ristoranti/App/presentation/bloc/Elementi_Home.dart';
import 'package:app_ristoranti/App/presentation/widgets/container_ristorante.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class User {
  String nome;
  String cognome;
  String foto;
  String mail;
  User(this.nome, this.cognome, this.mail, this.foto);

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
    return ColoredSafeArea(color: Color.fromARGB(255, 250, 182, 80), child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row( mainAxisAlignment: MainAxisAlignment.center,children: [Container(
          constraints: const BoxConstraints.expand(height: 200.0, width: 200),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
//color: Color.fromARGB(255, 250, 182, 80),
            color: Colors.black,
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Image.asset(user.foto,fit: BoxFit.fill,)
          ),
        )],),
      ],
    ));
  }

}