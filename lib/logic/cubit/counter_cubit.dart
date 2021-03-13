import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterVlaue: 0));

  void increment() => emit(
      CounterState(counterVlaue: state.counterVlaue + 1, wasIncremented: true));
  void decrement() => emit(CounterState(
      counterVlaue: state.counterVlaue - 1, wasIncremented: false));
}
