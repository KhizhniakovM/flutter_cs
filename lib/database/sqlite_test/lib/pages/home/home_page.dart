import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_test/blocs/model_bloc/model_bloc.dart';
import 'package:sqlite_test/helpers/universal.dart';
import 'package:sqlite_test/pages/home/home_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ModelBloc()),
      ],
      child: Universal.scaffold(
        materialAppBar: AppBar(
          title: Text('sqlite'),
        ),
        cupertinoNavigationBar: CupertinoNavigationBar(
          middle: Text('sqlite'),
        ),
        backgroundColor: Colors.white,
        child: HomeView(),
      ),
    );
  }
}
