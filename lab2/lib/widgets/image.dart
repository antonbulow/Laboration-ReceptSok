import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/cuisine.dart';

class RecipeImage extends StatelessWidget {
  final Recipe recipe;
  final double width;
  final double height;

  const RecipeImage({required this.recipe, required this.width, required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    final image = ClipRect(
      child: SizedBox( //Container
        width: width,
        height: height,
        child: FittedBox(
          fit: BoxFit.cover,
          child: recipe.image,
        ),
      ),
    );

    final flagImage = Cuisine.flag(recipe.cuisine, width: 24.0);

    return Stack(
      children: [
        image,
        if (flagImage != null)
          Positioned(
            bottom: 8,
            right: 8,
            child: flagImage,
          ),
      ],
    );
  }
}
