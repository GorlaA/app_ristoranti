import 'package:app_ristoranti/App/presentation/pages/profile_page.dart';
import 'package:app_ristoranti/App/presentation/pages/search_page.dart';
import 'package:app_ristoranti/App/presentation/pages/map_page.dart';
import 'package:flutter/material.dart';
import 'package:app_ristoranti/App/presentation/bloc/Elementi_Home.dart';
import 'package:app_ristoranti/App/presentation/widgets/container_ristorante.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => PageProvider(),)
        ],
        child: Home_app_page("Gabriele"),
      )
  );
}

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
  String nomeUtente = "";
  Color temaApp = Colors.black26;
  Home_app_page(this.nomeUtente, {Key? key}) : super(key: key){}
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "App",
      home: Scaffold(
        backgroundColor: temaApp,
        bottomNavigationBar: Bottom_Navigation_Bar(),
        body: MainWidget(),
      ),
    );
  }
}

class HomePage extends StatelessWidget{
  String nomeUtente = "";

  HomePage(this.nomeUtente, {Key? key}) : super(key: key);

  List<Ristorante> ristoranti = [
      Ristorante("Marcellino", "assets/images/Marcellino.jpg", 1, "Come un sarto che cuce abiti tailor made in base a gusto, personalità e esigenze, così Marcellino crea sul momento il tuo panino su misura, facendoti scegliere tra una grande varietà di ingredienti di prima scelta.",["Panino0","Panino1", "Panino2", "Panino3"], "Via Napo Torriani, 9, 20124 \nMilano MI", "Panineria", 15),
      Ristorante("Pescaria", "assets/images/Pescaria.jpg", 2, "", ["Panino0","Panino1", "Panino2"], "Via Sant'Anatalone, 16, 20147 Milano MI", "Panineria", 20),
      Ristorante("Mamma\nMilano", "assets/images/MammaMilano.jpg", 3, "", ["Panino0","Panino1", "Panino2", "Panino3"], "", "Panineria", 30),
      Ristorante("Beato te\nMilano", "assets/images/logoBeatoTe.jpg", 4, "", ["Panino0","Panino1", "Panino2", "Panino3"], "", "Ristorante", 40),
      Ristorante("PaninoLAB", "assets/images/paninolab-isola.jpg", 5, "", ["Panino0","Panino1", "Panino2", "Panino3"], "", "Panineria", 10),
    ];
  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(color: Color.fromARGB(255, 250, 182, 80),child: CustomScrollView(
      slivers: <Widget>[
        Sliver_App_Bar_Home(nomeUtente),
        ListaRistoranti("In evidenza", ristoranti),
        ListaRistoranti("Nelle vicinanze", ristoranti)
      ],
    ),);
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
  List<Widget> screens = [HomePage("Gabriele"), MapPage(), SearchPage(), ProfilePage(User("Gabriele", "Groppo", "lelegroppo.gg@gmail.com", "assets/images/FotoProfilo.jpg", "Milano (MI)"))];
  MainWidget();
  @override
  Widget build(BuildContext context) {
    int page = Provider.of<PageProvider>(context, listen: true).page;
    return screens[page];
  }

}


