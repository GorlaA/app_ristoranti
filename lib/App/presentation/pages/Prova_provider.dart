import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PizzaProvider extends ChangeNotifier{
  int numberOfPizza;
  PizzaProvider({this.numberOfPizza = 0});

  void changeNumberOfPizza(int newValue){
    numberOfPizza = newValue;
    notifyListeners();
  }
}

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => PizzaProvider(),)
        ],
        child: MaterialApp(
          home: Scaffold(
            body: PizzaShow(),
          ),
        ),
      )
  );
}

class PizzaShow extends StatelessWidget{
  PizzaShow();
  Widget build(BuildContext context) {
    int numberOfPizza = Provider.of<PizzaProvider>(context).numberOfPizza;
    return Column(
      children: [
        Text('You have ${numberOfPizza.toString()} Pizza'),
        ElevatedButton(onPressed: (){
          Provider.of<PizzaProvider>(context, listen: false).changeNumberOfPizza(numberOfPizza+1);
        }, child: Text('Add a Pizza'))
      ],
    );
  }
}

