import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [_controlPanel(context), _recipeArea(context)]),
      );  
    }

  Widget _controlPanel(context, {double width = 320}) {
    return Container(
        width: width,
        color: const Color.fromARGB(255, 210, 210, 210),
        child: Column(
          children: [
            Text('Recept Sök',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
              ),
            Text('Filtrera bland recept',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
            )
          ]
        ),
      );
    }

  Widget _recipeArea(context) {
    return Expanded(
        child: Container(color: const Color.fromARGB(255, 200, 194, 242)),
    );
  }
}
