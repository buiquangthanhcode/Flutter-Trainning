import 'package:flutter/material.dart';
import 'package:food_project/pages/seen/seen_body.dart';
import 'package:provider/provider.dart';

import '../config/const.dart';
import '../providers/product_provider.dart';
import 'favotite/favorite_body.dart';
import 'home/home_body.dart';

class MyApp extends StatefulWidget {
  static const routeName = '/';
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  late Future _dataFuture; // Khởi tạo mà chưa gán giá trị


  //Hàm này hiểu như thế nào ?
  //Giống Observe bên android  ?? 
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _dataFuture = Provider.of<ProductProvider>(context).readJson();
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeBody(),
    const FavoriteBody(),
    const SeenBody(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _dataFuture,
        builder: (BuildContext content, AsyncSnapshot snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Good Food'),
              backgroundColor: dColorMain,
            ),
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
              onTap: _onItemTapped,
              backgroundColor: dColorMain,
              iconSize: sizeIconButton,
              unselectedItemColor: dColorIconButtonInactive,
              selectedItemColor: dColorIconButtonActive,
            ),
          );
        });
  }
}
