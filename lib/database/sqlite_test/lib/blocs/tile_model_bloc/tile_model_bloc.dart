import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sqlite_test/models/data_model.dart';

part 'tile_model_event.dart';
part 'tile_model_state.dart';

class TileModelBloc extends Bloc<TileModelEvent, TileModelState> {

  final ModelAdapter adapter;
  
  TileModelBloc(this.adapter) : super(TileModelState(adapter));

  @override
  Stream<TileModelState> mapEventToState(
    TileModelEvent event,
  ) async* {
    if (event is TileModelToggle) {
      yield TileModelState(adapter);
    }
  }
}
