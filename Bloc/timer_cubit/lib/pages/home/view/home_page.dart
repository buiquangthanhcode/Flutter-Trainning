import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_cubit/pages/home/cubit/home_cubit.dart';
import 'home_view.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => TimerCubit(),
        child: HomeView(),
      ),
    );
  }
}
