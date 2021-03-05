import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/Meal.dart';
import '../widgets/meals_item.dart';
import '../dummyData.dart';

class CategoryMealsScreen extends StatelessWidget {

  static const Routename = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);
  // final String id;
  // final String title;
  // final Color color;
  //
  // CategoryMealsScreen(
  //     this.id,
  //     this.title,
  //     this.color
  //     );

  @override
  Widget build(BuildContext context) {

    final RouteArgs = ModalRoute.of(context).settings.arguments as Map<String , String>;
    final id = RouteArgs['id'];
    final title = RouteArgs['title'];
    final categoryMeals = availableMeals.where((meal){
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(itemBuilder: (ctx , index){
        // return Text(categoryMeals[index].title);
        return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity);

    }, itemCount: categoryMeals.length),
    );
  }
}