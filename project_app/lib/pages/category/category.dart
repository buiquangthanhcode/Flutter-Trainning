import 'package:flutter/material.dart';
import 'package:project_app/app/themes/config.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = '/category';
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final value = ModalRoute.of(context)!.settings.arguments as Map;
    // print(value);
    return Scaffold(
      body: MaterialButton(
        color: AppColor.blue,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Back Homepage"),
          // Text(value['name']),
        ]),
      ),
    );
  }
}
