part of 'counter_cubit.dart';

class CounterState extends Equatable {
  int counterVlaue;
  bool wasIncremented;
  CounterState({
    @required this.counterVlaue,
    this.wasIncremented
  });

  @override
  // TODO: implement props
  List<Object> get props => [this.counterVlaue,this.wasIncremented];
}
