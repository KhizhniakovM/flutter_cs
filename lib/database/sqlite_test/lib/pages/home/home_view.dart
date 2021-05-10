import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_test/blocs/model_bloc/model_bloc.dart';
import 'package:sqlite_test/pages/home/ui/tile.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _makeListView(context),
    );
  }

  Widget _makeListView(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
        itemCount: BlocProvider.of<ModelBloc>(context).modelRepo.list.length,
        itemBuilder: (context, index) {
          var adapter = BlocProvider.of<ModelBloc>(context).modelRepo.list[index];
          return Tile(adapter: adapter);
        });
  }
}
