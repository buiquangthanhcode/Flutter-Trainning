import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:week06/app/routes/router_name.dart';

import '../../pages/category/category_page.dart';
import '../../pages/home/home_page.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRouterName.homePage:
        return PageTransition(
          child: HomePage(),
          type: PageTransitionType.fade,
        );
      case CategoryPage.routerName:
        return PageTransition(
          child: CategoryPage(),
          type: PageTransitionType.fade,
        );
      default:
        _errPage();
    }
    return _errPage();
  }

  static Route _errPage() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('No Router'),
        ),
      );
    });
  }
}
