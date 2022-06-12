import 'package:flutter/material.dart';
import 'package:app_ristoranti/App/presentation/bloc/Elementi_Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:app_ristoranti/App/presentation/widgets/headings.dart';

import '../widgets/container_ristorante.dart';

class Ristorante_page extends StatelessWidget{
  Color temaApp = Colors.white;
  Ristorante ristorante;
  Ristorante_page(this.ristorante, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 250, 182, 80),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(ristorante.getImage()),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      titolo(ristorante.getNome()),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      subTitles("Valutazioni", Colors.black),
                      subTitlesLower("Nostre:", Colors.black),
                      starsIcons(),
                      subTitlesLower("Vostre: ", Colors.black),
                      heartIcons(),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      subTitles("Posizione", Colors.black),
                      subTitlesLower(ristorante.getIndirizzo(), Colors.black),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      subTitles("Social", Colors.black),
                      socialButtonIcons(),
                      //Padding(padding: EdgeInsets.only(top: 20)),
                      //subTitles("Tags"),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      subTitles("Foto", Colors.black),
                      Center(
                        child: Carousel_slider_foto_ristorante(ristorante.getFotos().length, ristorante),
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      subTitles("Orario", Colors.black),
                      subTitlesLower(ristorante.getOrario(), Colors.black),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      subTitles("Categoria", Colors.black),
                      subTitlesLower(ristorante.categoria, Colors.black),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      subTitles("Descrizione", Colors.black),
                      descrizioneRistorante(),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      subTitles("Valuta il ristorante", Colors.black),
                      RowheartIconsButtons(),
                    ],
                  )
                ],
              ),
            ),
          ]
        )
      );
  }

  Widget descrizioneRistorante(){
    return Center(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Text(ristorante.getDescrizione(), style: TextStyle(fontSize: 20),),
      ),
    );
  }
  Widget starsIcons() {
    double iconSize = 15;
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int i = 0; i < 5; i++) if(i< ristorante.getRating())Icon(Icons.star, color: Colors.lightBlueAccent,)else Icon(Icons.star_border, color: Colors.lightBlueAccent,)
          ],
        ),
    );
  }

  Widget RowheartIconsButtons() {
    double iconSize = 50;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (int i = 0; i < 5; i++) if(i< ristorante.getRatingPersonale())heartIconButton(false, iconSize)else heartIconButton(true, iconSize)
        ],
      ),
    );
  }

  Widget heartIconButton(bool empty, double iconSize) {
    Widget icon = Icon(Icons.favorite, color: Colors.lightBlueAccent, size: iconSize,);
    if(empty) {
      icon = Icon(Icons.favorite_border, color: Colors.lightBlueAccent, size: iconSize,);
    }
    return icon;
  }

  Widget heartIcons() {
    double iconSize = 15;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (int i = 0; i < 5; i++) if(i< ristorante.getCommunityRating())Icon(Icons.favorite, color: Colors.lightBlueAccent,)else Icon(Icons.favorite_border, color: Colors.lightBlueAccent,)
        ],
      ),
    );
  }
  Widget socialButtonIcons() {
    double iconSize = 25;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: const ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(90.0),),),color:Colors.lightBlueAccent,),
            child: IconButton(onPressed: null, icon: Icon(Icons.facebook, color: Colors.black, size: iconSize,),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: const ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(90.0),),),color:Colors.lightBlueAccent,),
            child: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.map,
                color: Colors.black,
                size: iconSize,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: const ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(90.0),),),color:Colors.lightBlueAccent,),
            child: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.phone,
                color: Colors.black,
                size: iconSize,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: const ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(90.0),),),color:Colors.lightBlueAccent,),
            child: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.ac_unit,
                color: Colors.black,
                size: iconSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BackButtonApp extends StatelessWidget{
  BuildContext previewsContext;
  BackButtonApp(this.previewsContext);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(previewsContext);
      },
      child: BackButtonIcon(),
    );
  }
}

class Carousel_slider_foto_ristorante extends StatelessWidget {
  int count;
  Ristorante ristorante;
  Carousel_slider_foto_ristorante(this.count, this.ristorante);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider.builder(
        options: CarouselOptions(
            height: 200,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
        ),
        itemCount: count,
        itemBuilder: (context, index, realIndex){
          return buildImage(ristorante.getTitoloCartella()+"/Panino"+index.toString(), index);
        },
      ),
    );
  }
  Widget buildImage(String url, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: const ShapeDecoration(
        color: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0),),
        ),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset("assets/images/"+url+".jpg", fit: BoxFit.fill,),
      ),
    );
  }
}

Widget titolo(String text) {
  return Row(
    children: [
      Padding(padding: EdgeInsets.only(left: 5)),
      Text(text, style: TextStyle(color: Colors.black, fontSize: 60),),
    ],
  );
}