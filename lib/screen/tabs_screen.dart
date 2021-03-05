import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../screen/favourites.dart';
import '../screen/categories.dart';

class tabScreen extends StatefulWidget {

  @override
  Tabscreenstate createState() => Tabscreenstate();
}

class Tabscreenstate extends State<tabScreen>{

  final List<Widget> pages = [
    categories(),
    favouritesScreen()
  ];

  int selectedPageIndex = 0;
  void selectedPage(int index){

    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(title: Text('Feed me more!'), bottom: TabBar(tabs: [
    //       Tab(icon: Icon(Icons.category),
    //       text: 'Categories',),
    //       Tab(icon: Icon(Icons.star),
    //       text: 'Favourites',)
    //     ],),
    //     ),
    //     body: TabBarView(children: [
    //       categories(),
    //      favouritesScreen()
    //     ],),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(title: Text('Feed me more!')
        ,),
      body: pages[selectedPageIndex],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectedPage,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category) , label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star) , label: 'Favourites')
        ],
      ),
    );

  }
}
