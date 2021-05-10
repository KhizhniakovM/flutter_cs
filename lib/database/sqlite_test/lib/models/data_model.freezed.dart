// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ModelTearOff {
  const _$ModelTearOff();

  _Model call({required String value}) {
    return _Model(
      value: value,
    );
  }
}

/// @nodoc
const $Model = _$ModelTearOff();

/// @nodoc
mixin _$Model {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ModelCopyWith<Model> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelCopyWith<$Res> {
  factory $ModelCopyWith(Model value, $Res Function(Model) then) =
      _$ModelCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class _$ModelCopyWithImpl<$Res> implements $ModelCopyWith<$Res> {
  _$ModelCopyWithImpl(this._value, this._then);

  final Model _value;
  // ignore: unused_field
  final $Res Function(Model) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ModelCopyWith<$Res> implements $ModelCopyWith<$Res> {
  factory _$ModelCopyWith(_Model value, $Res Function(_Model) then) =
      __$ModelCopyWithImpl<$Res>;
  @override
  $Res call({String value});
}

/// @nodoc
class __$ModelCopyWithImpl<$Res> extends _$ModelCopyWithImpl<$Res>
    implements _$ModelCopyWith<$Res> {
  __$ModelCopyWithImpl(_Model _value, $Res Function(_Model) _then)
      : super(_value, (v) => _then(v as _Model));

  @override
  _Model get _value => super._value as _Model;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_Model(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Model with DiagnosticableTreeMixin implements _Model {
  _$_Model({required this.value});

  @override
  final String value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Model(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Model'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Model &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$ModelCopyWith<_Model> get copyWith =>
      __$ModelCopyWithImpl<_Model>(this, _$identity);
}

abstract class _Model implements Model {
  factory _Model({required String value}) = _$_Model;

  @override
  String get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ModelCopyWith<_Model> get copyWith => throw _privateConstructorUsedError;
}
