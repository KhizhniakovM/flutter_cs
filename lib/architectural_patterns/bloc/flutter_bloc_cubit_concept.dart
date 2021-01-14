import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit_bloc_core_concept.dart';
import 'package:flutter/material.dart';

// Flutter BLoC Concepts
// All this concepts suitable for bloc and cubit
class CounterState {}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState());

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {}
}

// ==================================================
// BlocProvider
// Provide bloc unique instance of BLoC to subtree below it. DI of bloc.
Widget myBlocProvider() {
  return BlocProvider(
    create: (BuildContext context) => CounterBloc(),
    child: Container(), // Subtree
  );
}
// How to access BlocProvider
//```
// BlocProvider.of<CounterBloc>(context)
// or
// context.read<CounterBloc>() // context.bloc was deprecated
//```

// If we use it in another context
//```
// BlocProvider.value(
//  value: BlocProvider.of<CounterBloc>(context),
//  child: AnotherScreen(),
// )
//```

// ==================================================
// BlocBuilder
// Help to change UI based on BlocState changes
// Wrap only widget that will make changes
Widget myBuilder() {
  return BlocBuilder<CounterBloc, CounterState>(
    builder: (context, state) {
      return Container(); // Return widget that based on state
    },
  );
}

// ==================================================
// BlocListener
// Listener function called only once per state
// Used to show snackbars, navigation and other
Widget myListener() {
  return BlocListener<CounterBloc, CounterState>(
    listener: (context, state) {},
    child: Container(),
  );
}

// ==================================================
// BlocListener + BlocBuilder 
Widget myConsumer() {
  return BlocConsumer<CounterBloc, CounterState>(
    listener: (context, state) {},
    builder: (context, state) {
      return Container();
    },
  );
}

// ==================================================
// RepositoryProvider 
// Similar to BlocProvider. Create only one instance of Repository
// Repository - it is class, that contacts with databases, api and other external services
// Repository == Service 