import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screen/filter_screen.dart';

class MainDrawer extends StatelessWidget{

  Widget buildListTile(String text , IconData icon , Function TapHolder){

    return ListTile(
      leading: Icon(icon , size: 20,),
      title: Text(text,
        style: TextStyle(
            fontSize: 15,
          fontWeight: FontWeight.bold
        ),
      ),
      onTap: TapHolder,
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Crave more!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              fontSize: 30
            ),),
          ),

          buildListTile(
              'Meals',
              Icons.no_meals,
              (){
                Navigator.of(context).pushReplacementNamed('/');
              }),
          buildListTile('Filters',
              Icons.filter,
              (){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.RouteName);
              }),
        ],
      ),
    );
  }
}