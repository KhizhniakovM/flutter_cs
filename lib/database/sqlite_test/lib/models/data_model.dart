import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'data_model.freezed.dart';

@freezed
class Model with _$Model {
  factory Model({required String value}) = _Model;
}

class ModelAdapter {
  final Model model;
  
  bool _isSaved = false;
  bool get isSaved => _isSaved;

  ModelAdapter(this.model);

  void toggleIsSaved() {
    _isSaved = !_isSaved;
  }
}