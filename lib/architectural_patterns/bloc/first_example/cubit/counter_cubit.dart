import 'package:bloc/bloc.dart';

part 'counter_state.dart';

// We choose our state and make initial value for it = 0
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(CounterState(counterValue: state.counterValue + 1, isIncremented: true));
  void decrement() => emit(CounterState(counterValue: state.counterValue - 1, isIncremented: false));
}
