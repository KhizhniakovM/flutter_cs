part of 'counter_cubit.dart';

// Blueprint for all possible states which will be emitted by the cubit 
class CounterState {
  int counterValue;
  bool? isIncremented;

  CounterState({ required this.counterValue, this.isIncremented });
}
