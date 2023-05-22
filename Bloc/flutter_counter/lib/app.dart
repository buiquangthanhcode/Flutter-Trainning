import 'package:flutter/material.dart';
import 'package:flutter_counter/counter/cubit/counter_cubit.dart';
import 'package:flutter_counter/counter/view/counter_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterPage());
  }
}
