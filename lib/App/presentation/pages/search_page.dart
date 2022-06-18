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

import '../../domain/entities/ristorante.dart';
import '../widgets/shared_widgets.dart';

class SearchPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
        color: Color.fromARGB(255, 250, 182, 80),
        child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                collapsedHeight: 80,
                backgroundColor: Color.fromARGB(255, 250, 182, 80),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),)),
                title: ListTile(
                  contentPadding: EdgeInsets.only(left: 20, bottom: 0, top: 40),
                  title: Text("Ricerca",textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold)),
                )
              ),
              TopSearchPage()
            ],
        ),
    );
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
    return SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                subTitles("Proposta", Colors.lightBlueAccent),
              ],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              children: [
                Expanded(child: CategorysCheckBox(BoxCategory("").getBoxes(proposta))),
              ],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                subTitles("Tipologia", Colors.lightBlueAccent),
              ],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              children: [
                Expanded(child: CategorysCheckBox(BoxCategory("").getBoxes(tipologia))),
              ],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buttonSubmit(),
              ],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              children: [
                sliderContainerRistoranti(ristorantiTrovati),
              ],
            ),
        ],
      )
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
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 4),
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

class CategorysCheckBox extends StatefulWidget {
  List <BoxCategory> boxes;
  CategorysCheckBox(this.boxes);
  CategorysCheckBoxState createState() => CategorysCheckBoxState(this.boxes);
}

class CategorysCheckBoxState extends State<CategorysCheckBox>{
  List <BoxCategory> boxes;
  CategorysCheckBoxState(this.boxes);
  Color ottieniColore(int x) {
    Color color;
    if(boxes[x].getValue)
      color = Colors.lightBlueAccent;
    else
      color = Color.fromARGB(255, 250, 182, 80);
    return color;
  }
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: new BoxConstraints(maxHeight: 70),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(padding: EdgeInsets.only(left: 5)),
          for(int i = 0; i < boxes.length; i++)
            for(int j = 0; j < 2; j ++)
              if(j%2 == 0)
                GestureDetector(
                  onTap: () {
                    setState((){
                      boxes[i].toggleValue();
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    constraints: BoxConstraints.expand(height: 80, width: 130),
                    decoration: ShapeDecoration(
                      color: ottieniColore(i),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                    ),
                    child: Center(child: Text(boxes[i].getTitolo,textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),),
                  ),
                )
              else
                Padding(padding: EdgeInsets.all(5)),
          Padding(padding: EdgeInsets.only(right: 5)),
        ],
      ),
    );
  }
}

class BoxCategory {
  String titolo;
  bool value = false;
  BoxCategory(this.titolo);

  void toggleValue(){value = !value;}

  get getValue => value;
  get getTitolo => titolo;
  List <BoxCategory> getBoxes(List<String> titoli) {
    List <BoxCategory> boxes = <BoxCategory>[];
    for(int i = 0; i < titoli.length; i++){
      boxes.add(BoxCategory(titoli[i]));
    }
    return boxes;
  }
}

class buttonSubmit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Container(
          color: Colors.deepPurple,
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(5)),
              Text(
                "Submit",
                style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          )
      ) ,
    );
  }
}

