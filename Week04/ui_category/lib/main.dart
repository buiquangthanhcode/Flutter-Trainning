import 'package:flutter/material.dart';
import 'package:ui_category/category_provider/category_provider.dart';
import 'package:ui_category/page/main_ui.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => CategoryProvider(),
      child: const MaterialApp(
        title: "Study",
        debugShowCheckedModeBanner: false,
        home: UI(),
      ),
    ),
  ); // title ten cua du an
  // debug mode banner
}
