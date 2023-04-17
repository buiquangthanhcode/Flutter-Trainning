import 'package:flutter/material.dart';
import 'package:myproject/pages/homepage/home.dart';
import 'package:provider/provider.dart';

import '../../config/const.dart';
import '../../providers/product_provider.dart';
import '../favorite/favorite.dart';
import '../seen/seen.dart';

class UI extends StatefulWidget {
  const UI({super.key});

  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  int _selectedIndex = 0;
  var _dataFuture;
  static final List<Widget> _widgetOptions = <Widget>[
    const Homepage(),
    const Favorite(),
    const Seen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _dataFuture = Provider.of<ProductProvider>(context).readJson();
  }

  // Future<List<dynamic>> _getData() {
  //   final productProvider = Provider.of<ProductProvider>(context);
  //   final categoryProvider = Provider.of<CategoryProvider>(context);

  //   final results = Future.wait([
  //     // categoryProvider.readJson(),
  //     productProvider.readJson(),
  //   ]);
  //   return results;
  // }

  @override
  Widget build(BuildContext context) {;
    return FutureBuilder(
      future: _dataFuture,
      builder: (context, snapshot) {
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
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.timelapse_sharp),
                label: 'Seen',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped, // tại sao chỗ này không cần truyền index
            backgroundColor: dColorMain,
            iconSize: sizeIconButton,
            unselectedItemColor: dColorIconButtonInactive,
            selectedItemColor: dColorIconButtonActive,
          ),
        );
      },
    );
  }
}
