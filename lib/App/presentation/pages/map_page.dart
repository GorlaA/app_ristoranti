import 'package:app_ristoranti/App/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:app_ristoranti/App/presentation/bloc/Elementi_Home.dart';
import 'package:app_ristoranti/App/presentation/widgets/container_ristorante.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class MapPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Map", style: TextStyle(color: Colors.lightBlueAccent),),);
  }
}
