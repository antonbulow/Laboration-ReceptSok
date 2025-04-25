import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem(this.recipe, {required this.onTap, super.key});

  final Recipe recipe;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 128,
        child: Row(
          children: [
          // _image(recipe),
          _image(recipe),
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
                Row(
                  children: [
                    MainIngredient.icon(recipe.mainIngredient, width: 48)!,
                    Difficulty.icon(recipe.difficulty, width: 48)!,
                    Text('${recipe.time as String} minuter ${recipe.price as String} kr'),
                    ]
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return ListTile(
  //     leading: recipe.image,
  //     title: Text(recipe.name),
  //     onTap: onTap,
  //     shape: Border.all(),
  //   );
  // }
}