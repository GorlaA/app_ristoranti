import 'package:app_ristoranti/App/presentation/widgets/container_ristorante.dart';

import '../entities/ristorante.dart';

class RistoTesting {
  List<Ristorante> ristorantiTest = [
    Ristorante(
        "Marcellino", //Nome
        "assets/images/Marcellino.jpg", //Immagine principale
        1, //Nostra valutazione
        "Come un sarto che cuce abiti tailor made in base a gusto, personalità e esigenze, così Marcellino crea sul momento il tuo panino su misura, facendoti scegliere tra una grande varietà di ingredienti di prima scelta.",
        ["Panino0","Panino1", "Panino2", "Panino3"], //Nome immagini
        "Via Napo Torriani, 9, 20124 \nMilano MI", //via
        "Panineria", //Tipo
        15, //Prezzo
        3, //
        4 //Vostra valutazione
    ),
    Ristorante("Pescaria", "assets/images/Pescaria.jpg", 2, "", ["Panino0","Panino1", "Panino2"], "Via Sant'Anatalone, 16, 20147 Milano MI", "Panineria", 20, 4, 3),
    Ristorante("Mamma\nMilano", "assets/images/MammaMilano.jpg", 3, "", ["Panino0","Panino1", "Panino2", "Panino3"], "", "Panineria", 30, 4, 4),
    Ristorante("Beato te\nMilano", "assets/images/logoBeatoTe.jpg", 4, "", ["Panino0","Panino1", "Panino2", "Panino3"], "", "Ristorante", 40, 1, 3),
    Ristorante("PaninoLAB", "assets/images/paninolab-isola.jpg", 5, "", ["Panino0","Panino1", "Panino2", "Panino3"], "", "Panineria", 10, 2, 1),
  ];

  get getListaRistorantiTest => ristorantiTest;
  get getRistoranteTest => ristorantiTest[0];
}