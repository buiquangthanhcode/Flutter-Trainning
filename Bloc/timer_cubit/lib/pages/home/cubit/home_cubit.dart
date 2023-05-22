import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_cubit/pages/home/cubit/home_state.dart';

class TimerCubit extends Cubit<TimerState> {
  final int _defaultDuration = 60;
  late Timer _timer;
  late int _duration;

  TimerCubit() : super(TimerInitial(60));

  void start() {
    _duration = _defaultDuration;
    _timer = Timer.periodic(
        Duration(seconds: 1),
        (_) => {
              _duration--,
              emit(TimerRunInProgress(_duration)),
              if (_duration == 0)
                {
                  _timer.cancel(),
                  emit(TimerRunComplete()),
                }
            });
  }

  void pause() {
    _timer.cancel();
    emit(TimerRunPause(_duration));
  }

  void resume() {
    _timer = Timer.periodic(
        Duration(seconds: 1),
        (_) => {
              _duration--,
              emit(TimerRunInProgress(_duration)),
              if (_duration == 0)
                {
                  _timer.cancel(),
                  emit(TimerRunComplete()),
                }
            });
  }

  void reset() {
    _timer.cancel();
    _duration = _defaultDuration;
    emit(TimerInitial(_defaultDuration));
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }

  @override
  void onChange(Change<TimerState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
