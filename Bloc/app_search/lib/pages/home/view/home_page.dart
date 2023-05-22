import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_cubit/pages/home/cubit/search_cubit.dart';
import 'package:timer_cubit/pages/home/repository/MovieApi.dart';

import '../home.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => SearchCubit(),
        child: HomeView(),
      ),
    );
  }
}
