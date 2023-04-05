import 'package:flutter/material.dart';
import 'package:ui_category/category_provider/category_provider.dart';
import 'package:ui_category/page/home_page.dart';
import 'package:ui_category/page/main_ui.dart';
import 'package:provider/provider.dart';

import 'modal/category.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => CategoryProvider()..readJson(),
      child: const MaterialApp(
        title: "Study",
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      ),
    ),
  ); // title ten cua du an
  // debug mode banner
}
