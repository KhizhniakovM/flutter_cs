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
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context)
                            .decrement(); // We can use this method
                      },
                      child: Text('-'),
                      style: ButtonStyle(backgroundColor: MyColor()),
                    ),
                   TextButton(
                      onPressed: () {
                        context.read<CounterCubit>().increment();
                      },
                      child: Text('+'),
                      style: ButtonStyle(backgroundColor: MyColor()),
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

class MyColor extends MaterialStateColor {
  static const int _defaultColor = 0xcafefeed;
  static const int _pressedColor = 0xdeadbeef;

  const MyColor() : super(_defaultColor);

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return const Color(_pressedColor);
    }
    return const Color(_defaultColor);
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
                TextButton(
                    onPressed: () {
                      context.read<CounterCubit>().decrement();
                    },
                    style: ButtonStyle(backgroundColor: MyColor()),
                    child: Text('-')),
                TextButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    style: ButtonStyle(backgroundColor: MyColor()),
                    child: Text('+'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
