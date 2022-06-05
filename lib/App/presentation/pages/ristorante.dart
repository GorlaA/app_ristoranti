import 'package:flutter/material.dart';
import 'package:app_ristoranti/App/presentation/bloc/Elementi_Home.dart';
import 'package:app_ristoranti/App/presentation/widgets/container_ristorante.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Ristorante_page extends StatelessWidget{
  Color temaApp = Colors.white;
  Ristorante ristorante;
  Ristorante_page(this.ristorante, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: temaApp,
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
                      titolo("Marcellino"),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      subTitles("Social"),
                      socialButtonIcons(),
                      //Padding(padding: EdgeInsets.only(top: 20)),
                      //subTitles("Tags"),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      subTitles("Foto"),
                      Center(
                        child: Carousel_slider_foto_ristorante(ristorante.getFotos().length),
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      subTitles("Descrizione"),
                      descrizioneRistorante(),
                    ],
                  )
                ],
              ),
            ),
          ]
        )
      );
  }
  Widget subTitles(String text){
    return Row(children: [Padding(padding: EdgeInsets.only(left: 5)),Text(text,textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),],);
  }
  Widget titolo(String text) {
    return Row(
      children: [
        Padding(padding: EdgeInsets.only(left: 5)),
        Text(ristorante.getNome(), style: TextStyle(color: Colors.black, fontSize: 60),),
      ],
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
  Widget socialButtonIcons() {
    double iconSize = 25;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: Colors.white,
            child: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.facebook,
                color: Colors.black,
                size: iconSize,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: Colors.white,
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
            color: Colors.white,
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
            color: Colors.white,
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
  Carousel_slider_foto_ristorante(this.count);
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
          return buildImage("Panino"+index.toString(), index);
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
          child: Image.asset("assets/images/Marcellino/"+url+".jpg", fit: BoxFit.fill,),
      ),
    );
  }
}