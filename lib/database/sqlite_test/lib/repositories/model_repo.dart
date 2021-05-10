import 'package:sqlite_test/models/data_model.dart';

class ModelRepo {
  final List<ModelAdapter> _list = [
    ModelAdapter(Model(value: 'First')),
    ModelAdapter(Model(value: 'Second')),
    ModelAdapter(Model(value: 'Third')),
    ModelAdapter(Model(value: 'Fourth')),
    ModelAdapter(Model(value: 'Fifth')),
  ];
  List<ModelAdapter> get list => _list;
}
