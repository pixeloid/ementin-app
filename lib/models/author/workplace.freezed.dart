// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workplace.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Workplace {
  @JsonKey(name: '@id')
  String? get id;
  @JsonKey(name: '@type')
  String? get type;
  @JsonKey(name: '@name')
  String? get name;

  /// Create a copy of Workplace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkplaceCopyWith<Workplace> get copyWith =>
      _$WorkplaceCopyWithImpl<Workplace>(this as Workplace, _$identity);

  /// Serializes this Workplace to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Workplace &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, name);

  @override
  String toString() {
    return 'Workplace(id: $id, type: $type, name: $name)';
  }
}

/// @nodoc
abstract mixin class $WorkplaceCopyWith<$Res> {
  factory $WorkplaceCopyWith(Workplace value, $Res Function(Workplace) _then) =
      _$WorkplaceCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String? id,
      @JsonKey(name: '@type') String? type,
      @JsonKey(name: '@name') String? name});
}

/// @nodoc
class _$WorkplaceCopyWithImpl<$Res> implements $WorkplaceCopyWith<$Res> {
  _$WorkplaceCopyWithImpl(this._self, this._then);

  final Workplace _self;
  final $Res Function(Workplace) _then;

  /// Create a copy of Workplace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? name = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Workplace implements Workplace {
  const _Workplace(
      {@JsonKey(name: '@id') this.id,
      @JsonKey(name: '@type') this.type,
      @JsonKey(name: '@name') this.name});
  factory _Workplace.fromJson(Map<String, dynamic> json) =>
      _$WorkplaceFromJson(json);

  @override
  @JsonKey(name: '@id')
  final String? id;
  @override
  @JsonKey(name: '@type')
  final String? type;
  @override
  @JsonKey(name: '@name')
  final String? name;

  /// Create a copy of Workplace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkplaceCopyWith<_Workplace> get copyWith =>
      __$WorkplaceCopyWithImpl<_Workplace>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkplaceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Workplace &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, name);

  @override
  String toString() {
    return 'Workplace(id: $id, type: $type, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$WorkplaceCopyWith<$Res>
    implements $WorkplaceCopyWith<$Res> {
  factory _$WorkplaceCopyWith(
          _Workplace value, $Res Function(_Workplace) _then) =
      __$WorkplaceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String? id,
      @JsonKey(name: '@type') String? type,
      @JsonKey(name: '@name') String? name});
}

/// @nodoc
class __$WorkplaceCopyWithImpl<$Res> implements _$WorkplaceCopyWith<$Res> {
  __$WorkplaceCopyWithImpl(this._self, this._then);

  final _Workplace _self;
  final $Res Function(_Workplace) _then;

  /// Create a copy of Workplace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? name = freezed,
  }) {
    return _then(_Workplace(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
