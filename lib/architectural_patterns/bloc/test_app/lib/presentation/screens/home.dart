import 'package:flutter/material.dart';
import 'package:test_app/business_logic/bloc/counter_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            FloatingActionButton(onPressed: () => _increment(context)),
        body: _centralText(context));
  }

  void _increment(BuildContext context) {
    context.read<CounterBlocBloc>().add(CounterBlocEvent.increment);
  }

  Widget _centralText(BuildContext context) {
    return Center(child: BlocBuilder<CounterBlocBloc, CounterBlocState>(
      builder: (context, state) {
        return Text(state.counterValue.toString());
      },
    ));
  }
}