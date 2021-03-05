import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const RouteName = '/filters_screen';
  final Function savefilters;
  final Map<String , bool> currentFilters;

  FiltersScreen(this.currentFilters , this.savefilters);

  @override
  FilterScreenState createState() => FilterScreenState();
}

class FilterScreenState extends State<FiltersScreen> {

  var glutenFree = false;
  var lactoseFree = false;
  var isVegan = false;
  var isVegetarian = false;


  @override
  void initState() {

    glutenFree = widget.currentFilters['gluten'];
    lactoseFree = widget.currentFilters['lactose'];
    isVegan = widget.currentFilters['vegan'];
    isVegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSection(
      String title,
      String description,
      bool currentValue,
      Function updateValue
      ){
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue
    );

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Filters',
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
          ),
          actions: [
            IconButton(icon: Icon(Icons.save), onPressed: (){
              final selectedFilters = {
                'gluten' : glutenFree,
                'lactose' : lactoseFree,
                'vegan' : isVegan,
                'vegetarian' : isVegetarian
              };
              widget.savefilters(selectedFilters);
    },
            )
              ],
              ),
              drawer: MainDrawer(),
              body: Column(
              children: [
              Container(
              padding: EdgeInsets.all(20),
              child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
              ),
              ),
              Expanded(
              child: ListView(
              children: [
              buildSection('Gluten-free', 'Only include gluten free meals', glutenFree, (newValue){
              setState(() {
              glutenFree = newValue;
              });
            }),
                  buildSection('Lactose-free', 'Only include lactose free meals', lactoseFree, (newValue){
                    setState(() {
                      lactoseFree = newValue;
                    });
                  }),
                  buildSection('Vegan', 'Only include vegan meals', isVegan , (newValue){
                    setState(() {
                      isVegan = newValue;
                    });
                  }),
                  buildSection('Vegetarian', 'Only include vegetarian meals', isVegetarian, (newValue){
                    setState(() {
                      isVegetarian = newValue;
                    });
                  })
                ],
              ),
            )
          ],
        ));
  }
}
