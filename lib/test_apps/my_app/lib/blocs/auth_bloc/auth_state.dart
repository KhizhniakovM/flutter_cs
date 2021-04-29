part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {
  
}
class AuthWaiting extends AuthState {}
class AuthSuccess extends AuthState {}
class AuthDenied extends AuthState {}

