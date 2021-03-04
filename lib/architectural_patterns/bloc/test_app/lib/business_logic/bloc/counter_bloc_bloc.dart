import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_bloc_event.dart';
part 'counter_bloc_state.dart';

class CounterBlocBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  CounterBlocBloc() : super(CounterBlocInitial());

  @override
  Stream<CounterBlocState> mapEventToState(CounterBlocEvent event) async* {
    switch (event) {
      case CounterBlocEvent.increment:
        yield CounterBlocNormal(state.counterValue + 1);
        break;
      case CounterBlocEvent.decrement:
        yield CounterBlocNormal(state.counterValue - 1);
        break;
      default:
        break;
    }
  }
}
