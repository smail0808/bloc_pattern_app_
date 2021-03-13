import 'package:bloc_pattern/logic/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

main() {
  // Creates a group of tests.
  group('CounterCubit', () {
    CounterCubit counterCubit;
    // initialise the data test we are working with
    setUp(() {
      counterCubit = CounterCubit();
    });

    // get called after each test is runing
    tearDown(() {
      counterCubit.close();
    });
    // check if the initiale state of counterCubit  is equal to the counterState of a counterVlaue of 0
    test(
        'the initial state for the counterCubit is CounterStat(counterValue:0)',
        () {
      expect(counterCubit.state, CounterState(counterVlaue: 0));
    });

    blocTest(
      'the cubit should emit a CounterState(counterValue:1,wasIncrement:true) when cubit.increment() is called ',
      //return the cureent instance of the counterCubit
      build: ()=> counterCubit,
      act: (cubit)=>cubit.increment(),
      expect: [CounterState(counterVlaue: 1,wasIncremented: true)],
    );
    blocTest(
      'the cubit should emit a CounterState(counterValue:-1,wasIncrement:false) when cubit.decrement() is called ',
      //return the cureent instance of the counterCubit
      build: ()=> counterCubit,
      act: (cubit)=>cubit.decrement(),
      expect: [CounterState(counterVlaue: -1,wasIncremented: false)],
    );
  });
}
