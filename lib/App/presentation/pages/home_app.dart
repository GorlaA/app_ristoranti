import 'package:app_ristoranti/App/domain/test-values/Ristoranti_testing.dart';
import 'package:app_ristoranti/App/presentation/pages/empty_test_page.dart';
import 'package:app_ristoranti/App/presentation/pages/profile_page.dart';
import 'package:app_ristoranti/App/presentation/pages/search_page.dart';
import 'package:app_ristoranti/App/presentation/pages/map_page.dart';
import 'package:flutter/material.dart';
import 'package:app_ristoranti/App/presentation/bloc/Elementi_Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/ristorante.dart';
import '../../domain/entities/utente.dart';
import '../widgets/shared_widgets.dart';

class PageProvider extends ChangeNotifier{
  int page = 0;
  PageProvider();

  void changePage(newPage){
    page = newPage;
    notifyListeners();
  }
  get currentPage => page;
}

class Home_app_page extends StatelessWidget{
  User user;
  Color temaApp = Colors.black26;
  Home_app_page(this.user, {Key? key}) : super(key: key){}
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "App",
      home: Scaffold(
        backgroundColor: temaApp,
        bottomNavigationBar: Bottom_Navigation_Bar(),
        body: MainWidget(user),
      ),
    );
  }
}

class HomePage extends StatelessWidget{
  User utente;
  HomePage(this.utente, {Key? key}) : super(key: key);
  List<Ristorante> ristoranti = RistoTesting().getListaRistorantiTest;

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(color: Color.fromARGB(255, 250, 182, 80),
      child: CustomScrollView(
        slivers: <Widget>[
          Sliver_App_Bar_Home(utente.getNome),
          ListaRistoranti("In evidenza", ristoranti),
          ListaRistoranti("Nelle vicinanze", ristoranti)
        ],
      ),
    );
  }
}

class ColoredSafeArea extends StatelessWidget {
  final Widget child;
  final Color? color;

  const ColoredSafeArea({
    Key? key,
    required this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Theme.of(context).appBarTheme.backgroundColor,
      child: SafeArea(
        child: Container(
          color: Colors.black,
          child: child,
        ),
      ),
    );
  }
}

class MainWidget extends StatelessWidget{
  User utente;
  List<Widget> screens = <Widget>[];
  MainWidget(this.utente){this.screens = [HomePage(utente), EmptyPage(), SearchPage(), ProfilePage(utente)];}

  @override
  Widget build(BuildContext context) {
    int page = Provider.of<PageProvider>(context, listen: true).page;
    return screens[page];
  }
}


