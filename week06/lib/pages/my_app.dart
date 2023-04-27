import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week06/models/category.dart';
import 'package:week06/pages/navigation/navigation.dart';
import 'package:week06/provider/articles_provider.dart';
import 'package:week06/provider/category_provider.dart';

import '../app/routes/route.dart';
import '../app/themes/theme.dart';
import '../provider/them_provider.dart';
import 'category/category_page.dart';
import 'home/home_page.dart';

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
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ArticleProvider())
      ],
      builder: (context, child) {
        return Consumer<ThemeProvider>(
          builder: (context, value, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              // darkTheme: AppTheme.darkTheme,
              // themeMode: value.themeMode,
              home: Consumer<CategoryProvider>(
                builder: (context, value, child) {
                  final data = value.getRequest(
                      "http://apiforlearning.zendvn.com/api/categories_news?offset=0&limit=10&sort_by=id&sort_dir=asc");
                  return NavigationBottom();
                },
              ),
              onGenerateRoute: AppRoutes.onGenerateRoute,
            );
          },
        );
      },
    );
  }
}
