import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  static const routerName = '/category';
  const CategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('back'),
            )
          ],
        ),
      ),
    );
  }
}
