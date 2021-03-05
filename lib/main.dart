import 'package:flutter/material.dart';
import './dummyData.dart';
import './models/Meal.dart';
import './screen/filter_screen.dart';
import 'screen/tabs_screen.dart';
import './screen/meal_detail.dart';
import 'screen/category-meals-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State createState() => MyAppState();

  }

  class MyAppState extends State<MyApp> {

  Map<String , bool> fiters = {
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  void setFilters(Map<String , bool> filterData){
    setState(() {
      fiters = filterData;
      availableMeals = DUMMY_MEALS.where((Meal){

        if(fiters['gluten'] && !Meal.isGlutenFree){
          return false;
        }
        if(fiters['lactose'] && !Meal.isLactoseFree){
          return false;
        }
        if(fiters['vegan'] && !Meal.isVegan){
          return false;
        }
        if(fiters['vegetarian'] && !Meal.isVegetarian){
          return false;
        }
      }).toList();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontSize: 20,
                fontFamily: 'Roboto'
          )
        ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: categories(),
      initialRoute: '/',
      routes: {
        '/' : (ctx) => tabScreen(),
        CategoryMealsScreen.Routename : (ctx) => CategoryMealsScreen(availableMeals),
        MealsDetail.Routename : (ctx) => MealsDetail(),
        FiltersScreen.RouteName : (ctx) => FiltersScreen(fiters , setFilters)
      },
    );
  }
}

