import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqlite_test/models/data_model.dart';
import 'package:sqlite_test/repositories/model_repo.dart';

part 'model_event.dart';
part 'model_state.dart';

class ModelBloc extends Bloc<ModelEvent, ModelState> {
  final ModelRepo modelRepo = ModelRepo();

  ModelBloc() : super(ModelInitial());

  @override
  Stream<ModelState> mapEventToState(
    ModelEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
