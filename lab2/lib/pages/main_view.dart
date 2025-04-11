import 'package:flutter/material.dart';
import 'package:lab2/widgets/control_panel.dart';
import 'package:lab2/widgets/recipe_area.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [ControlPanel(), RecipeArea(context)]), //_recipeArea(context)
      );  
    }
  }
