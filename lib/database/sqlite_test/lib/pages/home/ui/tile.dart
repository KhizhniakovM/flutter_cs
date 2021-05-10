import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_test/blocs/model_bloc/model_bloc.dart';
import 'package:sqlite_test/models/data_model.dart';
import 'package:sqlite_test/helpers/universal.dart';

class Tile extends StatefulWidget {
  final ModelAdapter adapter;

  const Tile({Key? key, required this.adapter}) : super(key: key);

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.adapter.model.value),
      trailing: Universal.checkbox(
        value: widget.adapter.isSaved,
        onChanged: (b) {
          widget.adapter.toggleIsSaved();
          setState(() {});
        },
      ),
      onTap: () {
        final Map<String, dynamic>? arguments = {'bloc': BlocProvider.of<ModelBloc>(context)};

        Navigator.pushNamed(context, '/details', arguments: arguments);
      },
    );
  }
}
