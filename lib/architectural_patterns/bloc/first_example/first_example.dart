import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cs/architectural_patterns/bloc/first_example/cubit/counter_cubit.dart';

// Wrap Material app with Bloc provider
class FirstExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      // Choose our bloc Provider generic type
      create: (context) => CounterCubit(), // Create our cubit from context
      child: MaterialApp(
        title: 'First example',
        home: FirstExampleHomePage(), // Can change to consumer 
      ),
    );
  }
}

class FirstExampleHomePage extends StatefulWidget {
  @override
  _FirstExampleHomePageState createState() => _FirstExampleHomePageState();
}

class _FirstExampleHomePageState extends State<FirstExampleHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state.isIncremented == true) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Incremented'),
                duration: Duration(milliseconds: 500),
              ));
            } else if (state.isIncremented == false) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Decremented'),
                duration: Duration(milliseconds: 500),
              ));
            }
          },
          child: Center(
            child: Column(
              children: [
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return Text(
                      state.counterValue.toString(),
                      style: TextStyle(fontSize: 60),
                    );
                  },
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlatButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context)
                            .decrement(); // We can use this method
                      },
                      child: Text('-'),
                      color: Colors.red,
                    ),
                    FlatButton(
                      onPressed: () {
                        context.read<CounterCubit>().increment();
                      },
                      child: Text('+'),
                      color: Colors.green,
                    ),
                  ],
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ));
  }
}

// ================================================== // ==================================================
// Example with consumer bloc 
class FirstExampleHomePageConsumer extends StatefulWidget {
  @override
  _FirstExampleHomePageConsumerState createState() =>
      _FirstExampleHomePageConsumerState();
}

class _FirstExampleHomePageConsumerState
    extends State<FirstExampleHomePageConsumer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.isIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Incremented'),
                    duration: Duration(milliseconds: 500),
                  ));
                } else if (state.isIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Decremented'),
                    duration: Duration(milliseconds: 500),
                  ));
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: TextStyle(fontSize: 60),
                );
              },
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                    onPressed: () {
                      context.read<CounterCubit>().decrement();
                    },
                    color: Colors.red,
                    child: Text('-')),
                FlatButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    color: Colors.green,
                    child: Text('+'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
