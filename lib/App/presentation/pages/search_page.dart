import 'package:app_ristoranti/App/presentation/pages/home_app.dart';
import 'package:app_ristoranti/App/presentation/pages/profile_page.dart';
import 'package:app_ristoranti/App/presentation/widgets/headings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:app_ristoranti/App/presentation/bloc/Elementi_Home.dart';
import 'package:app_ristoranti/App/presentation/widgets/container_ristorante.dart';
import 'package:app_ristoranti/App/domain/test-values/Ristoranti_testing.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(color: Color.fromARGB(255, 250, 182, 80),child: TopSearchPage(),);
  }
}

class TopSearchPage extends StatefulWidget {
  _TopSearchPageState createState() =>_TopSearchPageState();
}

class _TopSearchPageState extends State<TopSearchPage>{
  List<Ristorante> ristorantiTrovati = RistoTesting().getListaRistorantiTest;
  List<String> tipologia =["Ristorante", "Panineria", "Pizzeria", "Bistrot", "Trattoria", "Sushi"];
  List<String> proposta=["Carne", "Pesce", "Vegano"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopBarPage("Ricerca"),
        Padding(padding: EdgeInsets.all(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            subTitles("Proposta", Colors.lightBlueAccent),
          ],
        ),
        Padding(padding: EdgeInsets.all(10)),
        Row(
          children: [
            Expanded(child: ListButtons(proposta)),
          ],
        ),
        Padding(padding: EdgeInsets.all(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            subTitles("Tipologia", Colors.lightBlueAccent),
          ],
        ),
        Padding(padding: EdgeInsets.all(10)),
        Row(
          children: [
            Expanded(child: ListButtons(tipologia)),
          ],
        ),
        Padding(padding: EdgeInsets.all(20)),
        Row(
          children: [
            sliderContainerRistoranti(ristorantiTrovati),
          ],
        )
      ],
    );
  }
}

class sliderContainerRistoranti extends StatefulWidget {
  List<Ristorante> ristorantiTrovati;
  sliderContainerRistoranti(this.ristorantiTrovati);
  _sliderContainerRistorantiState createState() => _sliderContainerRistorantiState(ristorantiTrovati);
}

class _sliderContainerRistorantiState extends State<sliderContainerRistoranti> {
  List<Ristorante> ristorantiTrovati;

  _sliderContainerRistorantiState(this.ristorantiTrovati);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: CarouselSlider.builder(
        options: CarouselOptions(
          disableCenter: true,
          viewportFraction: 1,
          autoPlay: false,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
        ),
        itemCount: ristorantiTrovati.length,
        itemBuilder: (context, index, realIndex){
          return Container_Ristorante(ristorantiTrovati[index]);
        },
      )
    );
  }

}

class CheckBoxSearch extends StatefulWidget{
  String title;
  CheckBoxSearch(this.title);
  @override
  _CheckBoxSearchState createState() => _CheckBoxSearchState(title);
}
@override
class _CheckBoxSearchState extends State<CheckBoxSearch> {
  bool value = false;
  String title;
  Color color = Color.fromARGB(255, 250, 182, 80);
  _CheckBoxSearchState(this.title);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState((){
          value = !value;
          if(color == Color.fromARGB(255, 250, 182, 80))
            color = Colors.lightBlueAccent;
          else
            color = Color.fromARGB(255, 250, 182, 80);
        });
        },
      child: Container(
        padding: EdgeInsets.all(5),
        constraints: BoxConstraints.expand(height: 80, width: 130),
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
        ),
        child: Center(child: Text(title,textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),),
      ),
    );
  }
}

class ListButtons extends StatelessWidget{
  List<String> categorie;
  ListButtons(this.categorie);
  @override
  Widget build(BuildContext context) {
      return ConstrainedBox(
          constraints: new BoxConstraints(maxHeight: 70),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(padding: EdgeInsets.only(left: 5)),
              for(int i = 0; i < categorie.length; i++)
                for(int j = 0; j < 2; j ++)
                  if(j%2 == 0)
                    CheckBoxSearch(categorie[i])
                  else
                    Padding(padding: EdgeInsets.all(5)),
              Padding(padding: EdgeInsets.only(right: 5)),
            ],
          ),
      );
  }

}