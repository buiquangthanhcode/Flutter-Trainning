import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:router_app/app/routes/route.dart';
import 'package:router_app/app/themes/theme.dart';
import 'package:router_app/pages/home/home_page.dart';
import 'package:router_app/provider/them_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        return Consumer<ThemeProvider>(
          builder: (context, value, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: value.themeMode,
              home: const HomePage(),
              onGenerateRoute: AppRoutes.onGenerateRoute,
            );
          },
        );
      },
    );
  }
}
