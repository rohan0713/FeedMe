import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../dummyData.dart';
import '../widgets/category_item.dart';
class categories extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
          padding: EdgeInsets.all(20),
          children: DUMMY_CATEGORIES.map(
                  (catData) => CategoryItem(
                  catData.id,
                  catData.title,
                  catData.color)).toList(),
      // body: ListView(
      //   padding: EdgeInsets.all(20),
      // children: DUMMY_CATEGORIES.map(
      //         (catData) => CategoryItem(
      //             catData.id,
      //             catData.title,
      //         catData.color)).toList()

      // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //     maxCrossAxisExtent: 200 ,
      //     childAspectRatio: 3/2,
      //     crossAxisSpacing: 20,
      //     mainAxisSpacing: 20)
      //
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,

      );
  }

}