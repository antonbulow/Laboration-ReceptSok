import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem(this.recipe, {required this.onTap, super.key});

  final Recipe recipe;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 128,
        child: Row(
          children: [
          _image(recipe),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Titel'),
                Text(
                  recipe.description,
                  overflow: TextOverflow.ellipsis, 
                  maxLines: 2,
                ),
                Row(
                  children: [
                    Text(recipe.name, style: AppTheme.mediumHeading),
                ]),
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