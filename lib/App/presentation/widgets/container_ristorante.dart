import 'package:app_ristoranti/App/presentation/pages/ristorante.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_ristoranti/App/presentation/bloc/Elementi_Home.dart';

class Container_Ristorante extends StatelessWidget{
  Ristorante ristorante;

  Container_Ristorante(this.ristorante);
  @override
  Widget build(BuildContext context){
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Ristorante_page(ristorante)),
          );
        },
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
      ),
      constraints: const BoxConstraints.expand(height: 200.0, width: 200),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
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
  final String descrizione;
  final List<String> foto;

  Ristorante(this.nome, this.image, this.rating, this.descrizione, this.foto);

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
}
