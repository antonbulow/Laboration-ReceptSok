import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/model/recipe_database/search_filter.dart';
import 'package:lab2/util/functions.dart';

class RecipeHandler extends ChangeNotifier {
  final List<Recipe> _recipes = [];
  final List<Recipe> _matchedRecipes = [];

  final SearchFilter _filter = SearchFilter.withoutName(null, 0, null, 0, null);

  RecipeHandler() {
    _loadRecipes();
  }

  List<Recipe> get recipes => _recipes;

  List<Recipe> get bestMatches => _matchedRecipes;

  void setDifficulty(String? difficulty) {
    if (difficulty != 'Alla') {
      _filter.difficulty = difficulty;
    } else {
      _filter.difficulty = null;
    }
    _matchRecipes();
  }

  void setMaxTime(int maxTime) {
    _filter.maxTime = maxTime;
    _matchRecipes();
  }

  void setCuisine(String? cuisine) {
    if (cuisine != 'Visa alla') {
      _filter.cuisine = cuisine;
    } else {
      _filter.cuisine = null;
    }
    _matchRecipes();
  }

  void setMaxPrice(int maxPrice) {
    _filter.maxPrice = maxPrice;
    _matchRecipes();
  }

  void setMainIngredient(String? mainIngredient) {
    if (mainIngredient != 'Visa alla') {
      _filter.mainIngredient = mainIngredient;
    } else {
      _filter.mainIngredient = null;
    }
    _matchRecipes();
  }

  void _matchRecipes() {
    _matchedRecipes.clear();

    for (final recipe in recipes) {
      recipe.match = _filter.matchAgainstRecipe(recipe);
      _matchedRecipes.add(recipe);
    }
    _matchedRecipes.sort((r1, r2) {
      if (r1.match == r2.match) {
        return 0;
      } else {
        return r1.match - r2.match < 0 ? 1 : -1;
      }
    });
    notifyListeners();
  }

  void _loadRecipes() async {
    //dbugPrint('_loadRecipes');
    final String jsonString = await rootBundle.loadString(
      'assets/recipes/recipes.json',
    );
    List data = jsonDecode(jsonString);

    for (int i = 0; i < data.length; i++) {
      //dbugPrint(data[1]);
      var recipe = Recipe.fromJson(data[i]);
      _recipes.add(recipe);

    }
    var loadOk = recipes.length == 16;
    var message =
        loadOk ? 'RecipeHandler: recipes loaded ok' : 'Recipe loading failed';
    dbugPrint(message);

    _matchedRecipes.addAll(_recipes);
    //if (false) _testFiltering();
    notifyListeners();
  }
}
