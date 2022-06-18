import 'package:flutter/material.dart';


Widget subTitles(String text, Color color){
  return Row(children: [Padding(padding: EdgeInsets.only(left: 5)),Text(text,textAlign: TextAlign.left, style: TextStyle(color: color, fontSize: 30, fontWeight: FontWeight.bold)),],);
}
Widget subTitlesLower(String text, Color color){
  return Row(children: [Padding(padding: EdgeInsets.only(left: 5, top: 5)),Text(text,textAlign: TextAlign.left, style: TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.normal)),],);
}