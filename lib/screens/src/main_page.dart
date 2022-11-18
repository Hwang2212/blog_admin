import 'package:Blog_web/screens/screens.dart';
import 'package:Blog_web/utils/src/app_assets.dart';
import 'package:Blog_web/utils/src/route_generator.dart';
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
    const HomeScreen(),
    const UserScreen(),
    const PostScreen(),
    const CategoryScreen()
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: Image.asset(AppAssets.BlogLogo),
          automaticallyImplyLeading: false,
          title: const Text('Blog Admin')),
      body: Row(children: [
        Flexible(
          flex: 1,
          child: NavigationRail(
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.home), label: Text('Home')),
                NavigationRailDestination(
                    icon: Icon(Icons.supervised_user_circle_outlined),
                    label: Text('Users')),
                NavigationRailDestination(
                    icon: Icon(Icons.content_copy_rounded),
                    label: Text('Posts')),
                NavigationRailDestination(
                    icon: Icon(Icons.category_rounded),
                    label: Text('Category')),
              ],
              selectedIndex: _selectedIndex),
        ),
        const VerticalDivider(),
        Flexible(flex: 10, child: _screens[_selectedIndex]),
      ]),
    );
  }
}
