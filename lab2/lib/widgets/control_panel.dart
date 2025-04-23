import 'package:flutter/material.dart';
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
        child: Column(
          children: [
            Logo(), 

            SizedBox(
              height: 16
            ),
            
            Text('Filtrera bland recept',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
            ),
            
            SizedBox(
              height: 16
            ),

            IngredientControl(),

            KitchenControl(),

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
      }