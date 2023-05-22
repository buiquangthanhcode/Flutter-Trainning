import 'package:flutter/material.dart';

import 'home/home.dart';
class MyApp extends StatelessWidget {
const MyApp({super.key});
@override
Widget build(BuildContext context) {
return const MaterialApp(
  title: 'App Search',
  home: Homepage(),
);
}
}