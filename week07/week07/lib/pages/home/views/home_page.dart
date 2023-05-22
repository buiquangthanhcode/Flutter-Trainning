import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week07/pages/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    print("Homepage"); // test xem ui có bị thay đổi không
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: BlocBuilder<HomeCubit, HomeSate>(
                builder: (context, state) {
                  return Text(state.number.toString());
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    return context.read<HomeCubit>().descreseContinus();
                  },
                  child: Icon(Icons.start),
                ),
                FloatingActionButton(
                  onPressed: () {
                    return context.read<HomeCubit>().decrement();
                  },
                  child: Icon(Icons.reset_tv_rounded),
                ),
              ],
            )
          ],
        ),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     FloatingActionButton(
        //       onPressed: () {
        //         return context.read<HomeCubit>().increment();
        //       },
        //       child: Icon(Icons.plus_one),
        //     ),
        //     BlocBuilder<HomeCubit, HomeSate>(
        //       builder: (context, state) {
        //         return Text(state.number.toString());
        //       },
        //     ),
        //     FloatingActionButton(
        //       onPressed: () {
        //         return context.read<HomeCubit>().decrement();
        //       },
        //       child: Icon(Icons.plus_one),
        //     ),
        //   ],
      ),
    );
  }
}
