import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../screen/meal_detail.dart';
import '../models/Meal.dart';

class MealItem extends StatelessWidget {

  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.affordability,
    @required this.complexity
  });

  void selectmeal(BuildContext context) {

    Navigator.of(context).pushNamed(MealsDetail.Routename , arguments: this.id);

  }

  String get ComplexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.challenging:
        return 'challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'unknown';
    }
  }

    String get AffordText{
      switch (affordability) {
        case Affordability.Affordable:
          return 'Affordable';
          break;
        case Affordability.pricey:
          return 'pricey';
          break;
        case Affordability.luxurious:
          return 'Luxurious';
          break;
        default:
          return 'unknown';
      }
    }

    @override
    Widget build(BuildContext context) {
      return InkWell(

        onTap: () => selectmeal(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: EdgeInsets.all(15),
          child:
          Column(
            children: [
              Stack(children: <Widget>[
                ClipRRect(borderRadius: BorderRadius.circular(10
                ),
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,)
                ),
                Positioned(
                  bottom: 20,
                  right: 10,

                  child: Container(
                    width: 300,
                    color: Colors.black45,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(title,
                      style: TextStyle(color: Colors.white,
                          fontSize: 26),
                      softWrap: true,
                      overflow: TextOverflow.fade,),
                  ),
                )

              ],),
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(width: 6,),
                        Text('$duration min')
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 6,),
                        Text(ComplexityText)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.money),
                        SizedBox(width: 6,),
                        Text(AffordText)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),

        ),
      );
    }
}