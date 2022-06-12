import 'package:app_ristoranti/App/presentation/pages/ristorante_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_ristoranti/App/presentation/bloc/Elementi_Home.dart';
import 'package:provider/provider.dart';

import 'headings.dart';

class Container_Ristorante extends StatelessWidget{
  Ristorante ristorante;

  Container_Ristorante(this.ristorante);
  @override
  Widget build(BuildContext context){
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Ristorante_page(ristorante)),
          );
        },
        child: Container(
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
            color: Color.fromARGB(255, 250, 182, 80),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 170,
                    height: 170,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(ristorante.getImage(),fit: BoxFit.fill,)
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [Container(padding: EdgeInsets.only(left: 5), child: Text(ristorante.getNome(), style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold), textScaleFactor: 2,),),],),
                  //Row(mainAxisAlignment: MainAxisAlignment.start, children: [Container(padding: EdgeInsets.zero, alignment: Alignment.bottomLeft, child: starsIcons(ristorante),)],),
                  Row(children: [Padding(padding: EdgeInsets.all(5))],),
                  Row(mainAxisAlignment: MainAxisAlignment.start,children: [subTitlesLower(ristorante.categoria, Colors.black)],),
                  Row(children: [Padding(padding: EdgeInsets.all(5))],),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [subTitlesLower(ristorante.getRating().toString()+"/5", Colors.black), Icon(Icons.star, color: Colors.lightBlueAccent,),subTitlesLower(ristorante.getCommunityRating().toString()+"/5", Colors.black), Icon(Icons.favorite, color: Colors.lightBlueAccent,)],),
                  Row(children: [Padding(padding: EdgeInsets.all(5))],),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children:[subTitlesLower(ristorante.getPrezzoMedio().toString()+"€", Colors.black)]),
                ],
              ),
            ],
          ),
        ),
      );
  }
}

class Ristorante {
  String nome;
  String image;
  int rating;
  int personalRating;
  int communityRating;
  String descrizione;
  List<String> foto;
  String indirizzo;
  String categoria;
  int prezzoMedio;

  Ristorante(this.nome, this.image, this.rating, this.descrizione, this.foto, this.indirizzo, this.categoria, this.prezzoMedio, this.personalRating, this.communityRating);

  void setPersonalRating(int newRating){
    personalRating = newRating;
  }

  String getNome(){
    return nome;
  }
  String getImage(){
    return image;
  }
  int getRating(){
    return rating;
  }
  String getDescrizione(){
    return descrizione;
  }
  List <String> getFotos() {
    return foto;
  }

  String getIndirizzo(){
    return indirizzo;
  }
  
  String getCategoria() {
    return categoria;
  }
  int getPrezzoMedio() {
    return prezzoMedio;
  }
  String getOrario() {
    return "10:00 - 15:00 / 18:00 - 23:00";
  }

  int getRatingPersonale() {
    return personalRating;
  }

  int getCommunityRating() {
    return communityRating;
  }

  String getTitoloCartella() {
    String aus = nome;
    return aus.replaceAll("\n", " ");
  }

}

Widget starsIcons(Ristorante ristorante) {
  double iconSize = 10;
  return Padding(
    padding: EdgeInsets.only(left: 10, top: 2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 0; i < 5; i++) if(i< ristorante.getRating())Icon(Icons.star, color: Colors.lightBlueAccent,)else Icon(Icons.star_border, color: Colors.lightBlueAccent,)
      ],
    ),
  );
}
Widget heartIcons(Ristorante ristorante) {
  double iconSize = 10;
  return Padding(
    padding: EdgeInsets.only(left: 10, top: 2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 0; i < 5; i++) if(i< ristorante.getRating())Icon(Icons.favorite, color: Colors.lightBlueAccent,)else Icon(Icons.favorite_border, color: Colors.lightBlueAccent,)
      ],
    ),
  );
}