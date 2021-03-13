import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/constants/enums.dart';
import 'package:bloc_pattern/logic/cubit/internet_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

// if we are connected  to wife the counter should increment
// if we are connected  to mobile the counter should decrement
class CounterCubit extends Cubit<CounterState> {
  // the counter cubit well be dependent on the internet cubit
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;

  CounterCubit({@required this.internetCubit})
      : super(CounterState(counterVlaue: 0)) {
    monitorInternetCubit();
  }

  StreamSubscription<InternetState> monitorInternetCubit() {
    return internetStreamSubscription = internetCubit.listen((internetState) {
    if (internetState is InternetConnected &&
        internetState.connectionType == ConnectionType.Wifi) {
      increment();
    } else if (internetState is InternetConnected &&
        internetState.connectionType == ConnectionType.Mobile) {
      decrement();
    }
  });
  }

  void increment() => emit(
      CounterState(counterVlaue: state.counterVlaue + 1, wasIncremented: true));
  void decrement() => emit(CounterState(
      counterVlaue: state.counterVlaue - 1, wasIncremented: false));

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
