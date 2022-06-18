import 'package:app_ristoranti/App/presentation/pages/ristorante_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_ristoranti/App/presentation/bloc/Elementi_Home.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/ristorante.dart';
import 'headings.dart';

class Container_Ristorante extends StatelessWidget{
  Ristorante ristorante;
  Color textColor = Color.fromARGB(255, 250, 182, 80);
  Color backGroundColor = Colors.black;
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
          margin: EdgeInsets.all(10),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            //color: Color.fromARGB(255, 250, 182, 80),
            color: backGroundColor,
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
                  Row(children: [Container(padding: EdgeInsets.only(left: 5), child: Text(ristorante.getNome(), style: TextStyle(color: textColor,fontWeight: FontWeight.bold), textScaleFactor: 2,),),],),
                  //Row(mainAxisAlignment: MainAxisAlignment.start, children: [Container(padding: EdgeInsets.zero, alignment: Alignment.bottomLeft, child: starsIcons(ristorante),)],),
                  Row(children: [Padding(padding: EdgeInsets.all(5))],),
                  Row(mainAxisAlignment: MainAxisAlignment.start,children: [subTitlesLower(ristorante.categoria, textColor)],),
                  Row(children: [Padding(padding: EdgeInsets.all(5))],),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [subTitlesLower(ristorante.getRating().toString()+"/5", textColor), Icon(Icons.star, color: Colors.lightBlueAccent,),subTitlesLower(ristorante.getCommunityRating().toString()+"/5", textColor), Icon(Icons.favorite, color: Colors.lightBlueAccent,)],),
                  Row(children: [Padding(padding: EdgeInsets.all(5))],),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children:[subTitlesLower(ristorante.getPrezzoMedio().toString()+"€", textColor)]),
                ],
              ),
            ],
          ),
        ),
      );
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