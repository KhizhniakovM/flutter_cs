import 'dart:async';

class MyBloc {
  // Создаем входящий и исходящий поток:
  // Входящий поток принимает в себя Event
  // Исходящий поток отдает State
  final _inputController = StreamController<MyBlocEvent>();
  final _outputController = StreamController<MyBlocState>.broadcast();

  // Создаем геттеры для "приемника" и "потока"
  Sink<MyBlocEvent> get sink => _inputController.sink;
  Stream<MyBlocState> get stream => _outputController.stream;

  // Создаем Инициализатор
  MyBloc() {
    _inputController.stream.listen(_onEvent);
    _outputController.add(MyBlocStateInitial());
  }

  void _onEvent(MyBlocEvent event) {
      if (event is MyBlocEventFetchData) {
        _outputController.add(MyBlocStateLoading());
        // Start fetch 
        // After receiving data 
        _outputController.add(MyBlocStateLoaded());
        // else 
        _outputController.add(MyBlocStateError());
      } else {

      }
  }

  void close() {}
}

abstract class MyBlocState {}
class MyBlocStateInitial extends MyBlocState {}
class MyBlocStateLoading extends MyBlocState {}
class MyBlocStateLoaded extends MyBlocState {}
class MyBlocStateError extends MyBlocState {}

abstract class MyBlocEvent {}
class MyBlocEventFetchData extends MyBlocEvent {}
