import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:router_app/app/routes/router_name.dart';
import 'package:router_app/provider/them_provider.dart';

class HomePage extends StatefulWidget {
  static const routerName = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
