import 'package:flutter/material.dart';
import 'package:project_app/pages/category/category.dart';
import 'package:provider/provider.dart';

import '../../provider/statusTheme.dart';

class Homepage extends StatefulWidget {
  static const routeName = '/homepage';
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<statusTheme>(
          builder: (context, value_item, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  onChanged: (bool value) {
                    status = !status;
                    value_item
                        .setThem(status ? ThemeMode.light : ThemeMode.dark);
                    print(status);
                  },
                  value: status,
                ),
                Text("Them", style: Theme.of(context).textTheme.bodyText1),
                MaterialButton(
                  color: Colors.amber,
                  onPressed: () {
                    Navigator.pushNamed(context, CategoryPage.routeName,
                        arguments: {
                          "name": "123899",
                        });
                  },
                  child: Text("Category",
                      style: Theme.of(context).textTheme.bodyText1),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
