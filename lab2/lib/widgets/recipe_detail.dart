import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/ingredient.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:lab2/widgets/image.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          uiController.deselectRecipe();
            },
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(width: AppTheme.paddingSmall),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(
            child: RecipeImage(recipe: recipe, width: 240, height: 240)
          ),
          Text('Ingredienser'),
          SizedBox(height: AppTheme.paddingSmall),
          Text('${recipe.servings} portioner'),
          SizedBox(height: AppTheme.paddingSmall),
          Row(children: [
            SizedBox(width: AppTheme.paddingSmall),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
    ]
  ),
      SizedBox(width: AppTheme.paddingMedium),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(recipe.name, style: AppTheme.largeHeading),
            Row(
              children: [
                MainIngredient.icon(recipe.mainIngredient, width: 18)!,
                SizedBox(width: AppTheme.paddingSmall),
                Difficulty.icon(recipe.difficulty, width: 48)!,
                SizedBox(width: AppTheme.paddingSmall),
                Text('${recipe.time} minuter  ${recipe.price} kr'),
                  ]
                ),
                SizedBox(height: AppTheme.paddingMedium),
                Text(recipe.description),
                SizedBox(height: AppTheme.paddingLarge),
                Text('Tillagning:', style: AppTheme.mediumHeading),
                SizedBox(height: AppTheme.paddingMedium),
                Text(recipe.instruction)
              ],
            )
          )
        ]
      )
    ],
  )
);
  }
}