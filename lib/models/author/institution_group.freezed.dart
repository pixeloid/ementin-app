// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'institution_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InstitutionGroup _$InstitutionGroupFromJson(Map<String, dynamic> json) {
  return _InstitutionGroup.fromJson(json);
}

/// @nodoc
mixin _$InstitutionGroup {
  @JsonKey(name: '@id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: '@type')
  String? get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstitutionGroupCopyWith<InstitutionGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstitutionGroupCopyWith<$Res> {
  factory $InstitutionGroupCopyWith(
          InstitutionGroup value, $Res Function(InstitutionGroup) then) =
      _$InstitutionGroupCopyWithImpl<$Res, InstitutionGroup>;
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String? id,
      @JsonKey(name: '@type') String? type,
      String? name});
}

/// @nodoc
class _$InstitutionGroupCopyWithImpl<$Res, $Val extends InstitutionGroup>
    implements $InstitutionGroupCopyWith<$Res> {
  _$InstitutionGroupCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InstitutionGroupCopyWith<$Res>
    implements $InstitutionGroupCopyWith<$Res> {
  factory _$$_InstitutionGroupCopyWith(
          _$_InstitutionGroup value, $Res Function(_$_InstitutionGroup) then) =
      __$$_InstitutionGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String? id,
      @JsonKey(name: '@type') String? type,
      String? name});
}

/// @nodoc
class __$$_InstitutionGroupCopyWithImpl<$Res>
    extends _$InstitutionGroupCopyWithImpl<$Res, _$_InstitutionGroup>
    implements _$$_InstitutionGroupCopyWith<$Res> {
  __$$_InstitutionGroupCopyWithImpl(
      _$_InstitutionGroup _value, $Res Function(_$_InstitutionGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_InstitutionGroup(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InstitutionGroup implements _InstitutionGroup {
  _$_InstitutionGroup(
      {@JsonKey(name: '@id') this.id,
      @JsonKey(name: '@type') this.type,
      this.name});

  factory _$_InstitutionGroup.fromJson(Map<String, dynamic> json) =>
      _$$_InstitutionGroupFromJson(json);

  @override
  @JsonKey(name: '@id')
  final String? id;
  @override
  @JsonKey(name: '@type')
  final String? type;
  @override
  final String? name;

  @override
  String toString() {
    return 'InstitutionGroup(id: $id, type: $type, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InstitutionGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InstitutionGroupCopyWith<_$_InstitutionGroup> get copyWith =>
      __$$_InstitutionGroupCopyWithImpl<_$_InstitutionGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InstitutionGroupToJson(
      this,
    );
  }
}

abstract class _InstitutionGroup implements InstitutionGroup {
  factory _InstitutionGroup(
      {@JsonKey(name: '@id') final String? id,
      @JsonKey(name: '@type') final String? type,
      final String? name}) = _$_InstitutionGroup;

  factory _InstitutionGroup.fromJson(Map<String, dynamic> json) =
      _$_InstitutionGroup.fromJson;

  @override
  @JsonKey(name: '@id')
  String? get id;
  @override
  @JsonKey(name: '@type')
  String? get type;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_InstitutionGroupCopyWith<_$_InstitutionGroup> get copyWith =>
      throw _privateConstructorUsedError;
}
