import 'package:arrivo_web/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List _screens = [
    HomeScreen(),
    UserScreen(),
    PostScreen(),
    CategoryScreen()
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          //Add Logo here
          Text('Arrivo Admin'),
        ],
      )),
      body: Row(children: [
        NavigationRail(
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations: [
              NavigationRailDestination(
                  icon: Icon(Icons.home), label: Text('Home')),
              NavigationRailDestination(
                  icon: Icon(Icons.supervised_user_circle_outlined),
                  label: Text('Users')),
              NavigationRailDestination(
                  icon: Icon(Icons.content_copy_rounded), label: Text('Posts')),
              NavigationRailDestination(
                  icon: Icon(Icons.category_rounded), label: Text('Category')),
            ],
            selectedIndex: _selectedIndex),
        Container(
            width: MediaQuery.of(context).size.width,
            child: _screens[_selectedIndex]),
      ]),
    );
  }
}
