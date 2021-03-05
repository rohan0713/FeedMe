import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screen/category-meals-screen.dart';

class CategoryItem extends StatelessWidget{

  final String id;
  final String title;
  final Color color;

  CategoryItem(
      this.id,
      this.title,
      this.color
      );
  // ignore: empty_constructor_bodies

  void selectCategory(BuildContext context){

    // for smaller apps
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    //   return CategoryMealsScreen(id , title , color);
    // }));
    
    //for bigger apps
    Navigator.of(context).pushNamed(CategoryMealsScreen.Routename , arguments: {'id' : id , 'title' : title});

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Expanded(
      child: InkWell(
        onTap: () => selectCategory(context),
       splashColor: Theme.of(context).primaryColor,
       borderRadius: BorderRadius.circular(15),

       child : Container(padding: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height/5,
      child: Wrap(
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: Text(title,
            style: Theme.of(context).textTheme.headline6,),
          ),

          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Text(title,
             style: TextStyle(color: Colors.cyanAccent , fontWeight: FontWeight.bold),
            softWrap: true,),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Text(title,
              style: TextStyle(color: Colors.cyanAccent , fontWeight: FontWeight.bold),
              softWrap: true,),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Text(title,
              style: TextStyle(color: Colors.cyanAccent , fontWeight: FontWeight.bold),
              softWrap: true,),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Text(title,
              style: TextStyle(color: Colors.cyanAccent , fontWeight: FontWeight.bold),
              softWrap: true,),
          ),Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Text(title,
              style: TextStyle(color: Colors.cyanAccent , fontWeight: FontWeight.bold),
              softWrap: true,),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Text(title,
              style: TextStyle(color: Colors.cyanAccent , fontWeight: FontWeight.bold),
              softWrap: true,),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Text(title,
              style: TextStyle(color: Colors.cyanAccent , fontWeight: FontWeight.bold),
              softWrap: true,),
          ),


        ],
      ),
        decoration: BoxDecoration
          (gradient: LinearGradient
          (colors: [color.withOpacity(0.7),
        color,]
        ,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(15)),
      )
      ),
    );
  }

}