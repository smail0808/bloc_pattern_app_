import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

// if we are connected  to wife the counter should increment
// if we are connected  to mobile the counter should decrement
class CounterCubit extends Cubit<CounterState> {
  // the counter cubit well be dependent on the internet cubit

  CounterCubit() : super(CounterState(counterVlaue: 0));

  void increment() => emit(
      CounterState(counterVlaue: state.counterVlaue + 1, wasIncremented: true));
  void decrement() => emit(CounterState(
      counterVlaue: state.counterVlaue - 1, wasIncremented: false));
}
