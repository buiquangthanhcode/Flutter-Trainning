import 'package:flutter/material.dart';
import 'package:timer_cubit/pages/home/cubit/home_cubit.dart';
import 'package:timer_cubit/pages/home/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TimerCubit, TimerState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  state.duration.toString(),
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is TimerInitial || state is TimerRunComplete)
                    FloatingActionButton(
                      onPressed: () {
                        context.read<TimerCubit>().start();
                      },
                      child: const Icon(Icons.play_arrow),
                    ),
                  if (state is TimerRunInProgress)
                    FloatingActionButton(
                      onPressed: () {
                        context.read<TimerCubit>().pause();
                      },
                      child: const Icon(Icons.pause),
                    ),
                  if (state is TimerRunPause)
                    FloatingActionButton(
                      onPressed: () {
                        context.read<TimerCubit>().resume();
                      },
                      child: const Icon(Icons.play_arrow),
                    ),
                  const SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      context.read<TimerCubit>().reset();
                    },
                    child: const Icon(Icons.replay),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
