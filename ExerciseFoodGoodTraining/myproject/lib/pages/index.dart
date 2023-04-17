import 'package:flutter/material.dart';
import 'package:myproject/pages/product/product.dart';
import 'package:myproject/pages/productDetail/productDetail.dart';
import 'package:myproject/pages/root/rootUI.dart';
import 'package:myproject/providers/product_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../app/routes/router_name.dart';
import '../models/product_model.dart';
import '../providers/category_provider.dart';
import 'homepage/home.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Food Good",
        debugShowCheckedModeBanner: false,
        home: const UI(),
        onGenerateRoute: (settings) {
          final args = settings.arguments;
          switch (settings.name) {
            case AppRouterName.categoryPage:
              return PageTransition(
                child: const Homepage(),
                type: PageTransitionType.bottomToTopJoined,
              );
            case AppRouterName.productPage:
              if (args != null && args is Map && args['categoryId'] is String) {
                return PageTransition(
                  child: ProductPage(categoryID: args['categoryId']),
                  type: PageTransitionType.bottomToTop,
                );
              }
              break;

            case AppRouterName.productDetailPage:
              if (args != null && args is Map && args['id'] is String) {
                return PageTransition(
                  child: ProductDetail(
                    id: args['id'],
                  ),
                  type: PageTransitionType.fade,
                );
              }
              break;
            default:
              // Nếu args là null hoặc không chứa categoryId, trả về trang mặc định
              return PageTransition(
                child: const Scaffold(
                    body: Center(child: Text('Invalid argument'))),
                type: PageTransitionType.bottomToTop,
              );
          }
        },
      ),
    );
  }
}
