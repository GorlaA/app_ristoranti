import 'package:app_ristoranti/App/presentation/pages/home_app.dart';
import 'package:app_ristoranti/App/presentation/pages/profile_page.dart';
import 'package:app_ristoranti/App/presentation/widgets/headings.dart';
import 'package:flutter/material.dart';
import 'package:app_ristoranti/App/presentation/bloc/Elementi_Home.dart';
import 'package:app_ristoranti/App/presentation/widgets/container_ristorante.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return TopSearchPage();
  }
}

class TopSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      child: Column(
        children: [
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
              Expanded(
                child: SizedBox(
                  child: Row(children: [CheckBoxSearch("Carne"), Padding(padding: EdgeInsets.all(5),), CheckBoxSearch("Pesce")],),
                ),
              ),
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
              Expanded(
                child: SizedBox(
                  child: Row(children: [CheckBoxSearch("Ristorante"), Padding(padding: EdgeInsets.all(5),), CheckBoxSearch("Panineria")],),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(20)),
          Row(
            children: [
              Expanded(child: SizedBox(child: Container_Ristorante(Ristorante("Marcellino", "assets/images/Marcellino.jpg", 1, "Come un sarto che cuce abiti tailor made in base a gusto, personalità e esigenze, così Marcellino crea sul momento il tuo panino su misura, facendoti scegliere tra una grande varietà di ingredienti di prima scelta.",["Panino0","Panino1", "Panino2", "Panino3"], "Via Napo Torriani, 9, 20124 \nMilano MI", "Panineria", 15, 3, 4)),))
            ],
          )
        ],
      ),
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