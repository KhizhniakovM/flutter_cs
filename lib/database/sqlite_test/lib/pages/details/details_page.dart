import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_test/blocs/tile_model_bloc/tile_model_bloc.dart';
import 'package:sqlite_test/models/data_model.dart';
import 'package:sqlite_test/helpers/universal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'details_view.dart';

class DetailsPage extends StatelessWidget {

  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TileModelBloc(adapter)),
      ],
      child: Universal.scaffold(
          child: const DetailsView(),
          materialAppBar: AppBar(),
          cupertinoNavigationBar: CupertinoNavigationBar()),
    );
  }
}
