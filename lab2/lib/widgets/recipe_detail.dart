import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/ingredient.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/widgets/image.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);

    // return ListView(
    //   children: [
    //     IconButton(
    //     icon: Icon(Icons.close),
    //     onPressed: () {
    //       uiController.deselectRecipe();
    //       },
    //     ),
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          uiController.deselectRecipe();
            },
          ),
        Row(children: [
          Column(
            children: [
           SizedBox(
          //  width: 240,
          //  height: 240,
           child: RecipeImage(recipe: recipe, width: 240, height: 240)
          ),
          Column(
            children: [
              for (Ingredient ingredient in recipe.ingredients)
                Row(
                  children: [
                    Text(ingredient.toString())
                ],
              )
            ],
          )
        ],
      ),
          Column(children: [],)
        ]
        )
        ],
      )
    );

        // SizedBox(
        //   width: 640,
        //   height: 480,
        //   child: recipe.image
        // ),
        // Text(recipe.name,
        // style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
        // ),
        // Text(recipe.instruction, 
        // style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)
        // )
    //   ]
    // );
  }
}