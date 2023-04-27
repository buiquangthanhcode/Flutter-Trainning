import 'package:flutter/material.dart';
import 'package:week06/models/category.dart';
import 'package:week06/pages/home/home_page.dart';

import '../category/category_page.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({super.key});

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CategoryPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // tại sao chỗ này không cần truyền index
        backgroundColor: Colors.white,
        iconSize: 20,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.amber,
      ),
    );
  }
}
