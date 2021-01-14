import 'dart:async';
import 'package:bloc/bloc.dart';
// Bloc Core Concepts
// We need to use bloc or cubit for every feature and action in your app

// Stream
Stream<int> boatStream() async* {
  for (int i = 1; i <= 10; i++) {
    print('Send boat #$i');
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}
// ==================================================
// async* - GENERATES async data
// yield - PUSHES the boat to the stream river 

// MARK: - CUBIT 
// UI send functions => Cubit return state 
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
// ==================================================
// Without subscription 
//```
// void main() {
//   CounterCubit counter = CounterCubit();
//   print(counter.state);
//   counter.increment();
//   print(counter.state);
//   counter.decrement();
//   print(counter.state);
// }
//```
// ==================================================
// With subscription
//```
// void main() async {
//   final CounterCubit counter = CounterCubit();
//   final StreamSubscription<int> subscription = counter.listen((number) { print(number);});
  
//   counter.increment();
//   counter.increment();

//   await Future.delayed(Duration.zero);
//   await subscription.cancel();
//   await counter.close();
// }
//```

// MARK: - BLoC 
enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
  }
}
// ==================================================
// In bloc you send events instead functions in cubit 
//```
// void main() async {
//   final CounterBloc counter = CounterBloc();
//   final StreamSubscription<int> subscription = counter.listen((number) { print(number);});
  
//   counter.add(CounterEvent.increment);
//   counter.add(CounterEvent.increment);
  
//   await Future.delayed(Duration.zero);
//   await subscription.cancel();
//   await counter.close();
// }
//```