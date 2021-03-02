import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (_) => CounterCubit(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            FloatingActionButton(onPressed: () => _increment(context)),
        body: _centralText(context));
  }

  void _increment(BuildContext context) {
    context.read<CounterCubit>().increment();
  }

  Widget _centralText(BuildContext context) {
    return Center(
        child: BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) => Text(state.counterValue.toString())));
  }
}
