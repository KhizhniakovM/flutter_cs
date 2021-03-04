part of 'counter_bloc_bloc.dart';

@immutable
abstract class CounterBlocState {
  int get counterValue;
}

class CounterBlocInitial extends CounterBlocState {
  final int _counterValue = 0;

  int get counterValue => _counterValue;
}

class CounterBlocNormal extends CounterBlocState {
  final int _counterValue;

  CounterBlocNormal(this._counterValue);

  int get counterValue => _counterValue;
}