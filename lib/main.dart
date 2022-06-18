import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../App/domain/entities/utente.dart';
import 'App/presentation/pages/home_app.dart';

void main() {
  User user = User("Gabriele", "Groppo", "lelegroppo.gg@gmail.com", "assets/images/FotoProfilo.jpg", "Milano (MI)");
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => PageProvider(),)
        ],
        child: Home_app_page(user),
      )
  );
}

