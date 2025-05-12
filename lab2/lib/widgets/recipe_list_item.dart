import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:lab2/widgets/image.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem(this.recipe, {required this.onTap, super.key});

  final Recipe recipe;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: InkWell( // Nytt
      borderRadius: BorderRadius.circular(12),
      splashColor: Colors.blue.withAlpha(30),
      onTap: onTap,
        child: SizedBox(
          height: 128,
          child: Row(
            children: [
            SizedBox(width: AppTheme.paddingMediumSmall),
            RecipeImage(recipe: recipe, width: 104, height: 104),
            SizedBox(width: AppTheme.paddingMediumSmall),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(recipe.name, style: AppTheme.mediumHeading),
                  Text(
                    recipe.description,
                    overflow: TextOverflow.ellipsis, 
                    maxLines: 2,
                  ),
                  SizedBox(height: AppTheme.paddingSmall),
                  Row(
                    children: [
                      MainIngredient.icon(recipe.mainIngredient, width: 18)!,
                      SizedBox(width: AppTheme.paddingSmall),
                      Difficulty.icon(recipe.difficulty, width: 48)!,
                      SizedBox(width: AppTheme.paddingSmall),
                      Text('${recipe.time} minuter  ${recipe.price} kr'),
                      ]
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}