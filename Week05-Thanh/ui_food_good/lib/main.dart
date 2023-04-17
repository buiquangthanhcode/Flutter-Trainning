import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_food_good/pages/homepage/homepage.dart';
import 'package:ui_food_good/pages/homepage/widget/category.dart';
import 'package:ui_food_good/pages/homepage/widget/product.dart';
import 'package:ui_food_good/pages/index.dart';
import 'package:ui_food_good/providers/category_provider.dart';
import 'package:ui_food_good/providers/product_provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ChangeNotifierProvider(create: (_) => ProductProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        MyApp.routeName: ((context) => const MyApp()),
        CategoryPage.routeName: ((context) => const CategoryPage()),
        ProductPage.routeName: ((context) => const ProductPage()),
      },
    ),
  ));
}
