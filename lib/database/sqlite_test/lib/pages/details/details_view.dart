import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_test/blocs/tile_model_bloc/tile_model_bloc.dart';

class DetailsView extends StatelessWidget {
  const DetailsView();

  @override
  Widget build(BuildContext context) {
    final adapter = BlocProvider.of<TileModelBloc>(context).adapter;

    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(adapter.model.value),
            BlocBuilder<TileModelBloc, TileModelState>(
                builder: (context, state) {
              return Text(adapter.isSaved ? 'True' : 'False');
            }),
            BlocBuilder<TileModelBloc, TileModelState>(
                builder: (context, state) {
              return Checkbox(
                  value: adapter.isSaved,
                  onChanged: (b) {
                    adapter.toggleIsSaved();
                    context.read<TileModelBloc>().add(TileModelToggle());
                  });
            }),
          ],
        ),
      ),
    );
  }
}
