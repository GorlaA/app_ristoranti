import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
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
class Top_Bar extends StatelessWidget {
  int nomeImg = 0 ;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
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
        SliverFixedExtentList(
          //setta la dimensione del box
          itemExtent: 150.0,
          //creo la lista di elenti
          delegate: SliverChildListDelegate([
            //tra parentesi metto il nome (quello che nella classe news sarà il nome)
            //la prima parte e l'ultima sono stringhe, la parte immezzo è un intero generato random e convertito
            //in stringa (altrimenti non lo legge)
            //per il random ho importato la librera 'dart:math'
            News("asset/"+(Random().nextInt(12)+1).toString()+".PNG"),
            News("asset/"+(Random().nextInt(12)+1).toString()+".PNG"),
            News("asset/"+(Random().nextInt(12)+1).toString()+".PNG"),
            News("asset/"+(Random().nextInt(12)+1).toString()+".PNG"),
            News("asset/"+(Random().nextInt(12)+1).toString()+".PNG"),

          ],
          ),
        ),
      ],
    );
  }

}

//classe news
class News extends StatelessWidget {
  //creo la variabile per inserire il nome
  final String nome;
  News(this.nome);
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: const Color.fromARGB(255, 227, 140, 9)),
       //immagine
       child: Image.asset(
         //indirizzo dell'immagine
        nome,
        //dimensioni che non funzionano
        height: 20,
        width: 20
       )
    );
  }
}

