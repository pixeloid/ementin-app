// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workplace.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Workplace _$WorkplaceFromJson(Map<String, dynamic> json) {
  return _Workplace.fromJson(json);
}

/// @nodoc
mixin _$Workplace {
  @JsonKey(name: '@id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: '@type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: '@name')
  String? get name => throw _privateConstructorUsedError;
  Workplace? get workplace => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkplaceCopyWith<Workplace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkplaceCopyWith<$Res> {
  factory $WorkplaceCopyWith(Workplace value, $Res Function(Workplace) then) =
      _$WorkplaceCopyWithImpl<$Res, Workplace>;
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String? id,
      @JsonKey(name: '@type') String? type,
      @JsonKey(name: '@name') String? name,
      Workplace? workplace});

  $WorkplaceCopyWith<$Res>? get workplace;
}

/// @nodoc
class _$WorkplaceCopyWithImpl<$Res, $Val extends Workplace>
    implements $WorkplaceCopyWith<$Res> {
  _$WorkplaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? workplace = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      workplace: freezed == workplace
          ? _value.workplace
          : workplace // ignore: cast_nullable_to_non_nullable
              as Workplace?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkplaceCopyWith<$Res>? get workplace {
    if (_value.workplace == null) {
      return null;
    }

    return $WorkplaceCopyWith<$Res>(_value.workplace!, (value) {
      return _then(_value.copyWith(workplace: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WorkplaceCopyWith<$Res> implements $WorkplaceCopyWith<$Res> {
  factory _$$_WorkplaceCopyWith(
          _$_Workplace value, $Res Function(_$_Workplace) then) =
      __$$_WorkplaceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String? id,
      @JsonKey(name: '@type') String? type,
      @JsonKey(name: '@name') String? name,
      Workplace? workplace});

  @override
  $WorkplaceCopyWith<$Res>? get workplace;
}

/// @nodoc
class __$$_WorkplaceCopyWithImpl<$Res>
    extends _$WorkplaceCopyWithImpl<$Res, _$_Workplace>
    implements _$$_WorkplaceCopyWith<$Res> {
  __$$_WorkplaceCopyWithImpl(
      _$_Workplace _value, $Res Function(_$_Workplace) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? workplace = freezed,
  }) {
    return _then(_$_Workplace(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      workplace: freezed == workplace
          ? _value.workplace
          : workplace // ignore: cast_nullable_to_non_nullable
              as Workplace?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Workplace implements _Workplace {
  _$_Workplace(
      {@JsonKey(name: '@id') this.id,
      @JsonKey(name: '@type') this.type,
      @JsonKey(name: '@name') this.name,
      this.workplace});

  factory _$_Workplace.fromJson(Map<String, dynamic> json) =>
      _$$_WorkplaceFromJson(json);

  @override
  @JsonKey(name: '@id')
  final String? id;
  @override
  @JsonKey(name: '@type')
  final String? type;
  @override
  @JsonKey(name: '@name')
  final String? name;
  @override
  final Workplace? workplace;

  @override
  String toString() {
    return 'Workplace(id: $id, type: $type, name: $name, workplace: $workplace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Workplace &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.workplace, workplace) ||
                other.workplace == workplace));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, name, workplace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkplaceCopyWith<_$_Workplace> get copyWith =>
      __$$_WorkplaceCopyWithImpl<_$_Workplace>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkplaceToJson(
      this,
    );
  }
}

abstract class _Workplace implements Workplace {
  factory _Workplace(
      {@JsonKey(name: '@id') final String? id,
      @JsonKey(name: '@type') final String? type,
      @JsonKey(name: '@name') final String? name,
      final Workplace? workplace}) = _$_Workplace;

  factory _Workplace.fromJson(Map<String, dynamic> json) =
      _$_Workplace.fromJson;

  @override
  @JsonKey(name: '@id')
  String? get id;
  @override
  @JsonKey(name: '@type')
  String? get type;
  @override
  @JsonKey(name: '@name')
  String? get name;
  @override
  Workplace? get workplace;
  @override
  @JsonKey(ignore: true)
  _$$_WorkplaceCopyWith<_$_Workplace> get copyWith =>
      throw _privateConstructorUsedError;
}
