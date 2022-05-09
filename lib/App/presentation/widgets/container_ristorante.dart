import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_ristoranti/App/presentation/bloc/Elementi_Home.dart';

/*Container(
constraints: BoxConstraints.expand(height: 100.0, width: 200),
padding: EdgeInsets.all(10),
decoration: ShapeDecoration(
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.all(
Radius.circular(20.0),
),
),
color: Colors.red),
child: Text("Container with ShapeDecoration"),
),*/
class Container_Ristorante extends StatelessWidget{
  Ristorante ristorante;

  Container_Ristorante(this.ristorante);
  @override
  Widget build(BuildContext context){
    return Container(
      child: Row(
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
          Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(left: 10),
                child: Title(color: Colors.black, child: Text(ristorante.getNome(), style: const TextStyle(fontWeight: FontWeight.bold), textScaleFactor: 2,),),
              ),
              Container(
                padding: EdgeInsets.zero,
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    for (int i = 0; i < ristorante.getRating(); i++) Icon(Icons.star, color: Colors.lightBlueAccent,)
                  ]
                )
              )
            ],
          ),
        ],
      ),
      constraints: const BoxConstraints.expand(height: 200.0, width: 200),
      padding: const EdgeInsets.all(10),
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
      color: Color.fromARGB(255, 250, 182, 80),
      ),
    );
  }
}

class Ristorante {
  final String nome;
  final String image;
  final int rating;

  Ristorante(this.nome, this.image, this.rating);

  String getNome(){
    return this.nome;
  }
  String getImage(){
    return this.image;
  }
  int getRating(){
    return this.rating;
  }
}

/*
* child: Column(
          children: <Widget>[
            Container(
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(ristorante.getImage()),
                  alignment: Alignment.centerLeft,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
              ),
            ),
            Text(ristorante.getNome(), textAlign: TextAlign.right),
          ],
        )
* */