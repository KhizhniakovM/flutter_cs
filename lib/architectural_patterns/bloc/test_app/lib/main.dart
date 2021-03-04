import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/business_logic/bloc/counter_bloc_bloc.dart';
import 'package:test_app/presentation/screens/home.dart';
// import 'cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBlocBloc>(
      create: (_) => CounterBlocBloc(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
