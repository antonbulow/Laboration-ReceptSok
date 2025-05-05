import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/logo.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/time_control.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({this.width = 320, super.key});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        color: const Color.fromARGB(255, 210, 210, 210),
        child: 
        Padding(
          padding: EdgeInsets.only(left: AppTheme.paddingMedium),
          child:  
        Column(
          children: [
            Logo(), 

            SizedBox(
              height: AppTheme.paddingMedium
            ),

              Text('Hitta ett recept som passar genom att ändra inställningarna nedanför',
              style: AppTheme.smallHeading
            ),
            
            SizedBox(
              height: AppTheme.paddingMedium
            ),

            IngredientControl(),

            SizedBox(height: AppTheme.paddingSmall),

            KitchenControl(),

            SizedBox(
              height: AppTheme.paddingMedium
            ),

            Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Svårighetsgrad', 
                  style: AppTheme.smallHeading
                ),
              ]
            ),

            DifficultyControl(),
            
            SizedBox(height: AppTheme.paddingMedium),

            Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Maxpris:', 
                style: AppTheme.smallHeading
                ),
              ]
            ),

            PriceControl(),
            
            SizedBox(
              height: AppTheme.paddingMedium
            ),

            Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Maxtid:', 
                style: AppTheme.smallHeading
                ),
              ]
            ),
            TimeControl()
              ]
            ),
          ),
        );
      }
    }