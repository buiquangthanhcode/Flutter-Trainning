import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_app/app/routes/router_name.dart';
import 'package:project_app/app/themes/theme.dart';
import 'package:project_app/provider/statusTheme.dart';
import 'package:provider/provider.dart';

import 'category/category.dart';
import 'home/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => statusTheme(),
      builder: (context, child) {
        return MaterialApp(
          title: "Study",
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: Provider.of<statusTheme>(context, listen: false)
              .theme, // di theo cai app
          // theme: ThemeData(scaffoldBackgroundColor: Colors.black),
          //  initialRoute: '/homepage',
          // routes: {
          //   Homepage.routeName: ((context) => const Homepage()),
          //   CategoryPage.routeName: ((context) => const CategoryPage()),
          //Bock , get It , Provider 

          // },
          home: Homepage(),
          // Muon gui du lieu la di quan thang on GenerateRoute het r kiem tra moi dua vao trong page de hien thi du lieu 
          onGenerateRoute: (settings) {
            final args = settings.arguments;
            switch (settings.name) {
              case AppRouterName.homePage:
                return PageTransition(
                  child: Homepage(),
                  type: PageTransitionType.bottomToTop,
                );
              case AppRouterName.categoryPage:
                return PageTransition(
                  child: CategoryPage(),
                  type: PageTransitionType.bottomToTop,
                );
              default:
            }
          },
        );
      },
    );
  }
}
