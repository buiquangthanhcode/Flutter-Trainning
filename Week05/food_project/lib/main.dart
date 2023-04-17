import 'package:flutter/material.dart';
import 'package:food_project/pages/home/widget/category.dart';
import 'package:food_project/pages/home/widget/product.dart';
import 'package:food_project/pages/index.dart';
import 'package:food_project/providers/category_provider.dart';
import 'package:food_project/providers/product_provider.dart';
import 'package:provider/provider.dart';

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
