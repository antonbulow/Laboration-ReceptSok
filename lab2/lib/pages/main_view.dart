import 'package:flutter/material.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/recipe_area.dart';
import 'package:lab2/widgets/time_control.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [_controlPanel(context), RecipeArea(context)]), //_recipeArea(context)
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

            SizedBox(
              height: 16
            ),
            
            Text('Filtrera bland recept',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
            ),
            
            SizedBox(
              height: 16
            ),

            Row(
              children: [
                Text('Ingrediens', 
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)
                ), IngredientControl()
              ]
            ),
            
            SizedBox(
              height: 16
            ),

            Row(
              children: [
                Text('Kök', 
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)
                ), KitchenControl()
              ]
            ),
            
            SizedBox(
              height: 16
            ),

            Text('Svårighetsgrad', 
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)
                ), 
            DifficultyControl(),
            
            Text('Maxpris:', 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)
                ),
            PriceControl(),
            
            SizedBox(
              height: 16
            ),

            Text('Maxtid:', 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)
                ),
            TimeControl()
              ]
            ),
          );
        }

  // Widget _recipeArea(context) {
  //   var showList = false;
  //   var contents = showList ? RecipeList() : RecipeDetail();

  //   return Expanded(child: contents);
  // }
}
