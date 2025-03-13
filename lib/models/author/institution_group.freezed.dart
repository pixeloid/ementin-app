// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'institution_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InstitutionGroup {
  @JsonKey(name: '@id')
  String? get id;
  @JsonKey(name: '@type')
  String? get type;
  String? get name;

  /// Create a copy of InstitutionGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InstitutionGroupCopyWith<InstitutionGroup> get copyWith =>
      _$InstitutionGroupCopyWithImpl<InstitutionGroup>(
          this as InstitutionGroup, _$identity);

  /// Serializes this InstitutionGroup to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InstitutionGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, name);

  @override
  String toString() {
    return 'InstitutionGroup(id: $id, type: $type, name: $name)';
  }
}

/// @nodoc
abstract mixin class $InstitutionGroupCopyWith<$Res> {
  factory $InstitutionGroupCopyWith(
          InstitutionGroup value, $Res Function(InstitutionGroup) _then) =
      _$InstitutionGroupCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String? id,
      @JsonKey(name: '@type') String? type,
      String? name});
}

/// @nodoc
class _$InstitutionGroupCopyWithImpl<$Res>
    implements $InstitutionGroupCopyWith<$Res> {
  _$InstitutionGroupCopyWithImpl(this._self, this._then);

  final InstitutionGroup _self;
  final $Res Function(InstitutionGroup) _then;

  /// Create a copy of InstitutionGroup
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
class _InstitutionGroup implements InstitutionGroup {
  const _InstitutionGroup(
      {@JsonKey(name: '@id') this.id,
      @JsonKey(name: '@type') this.type,
      this.name});
  factory _InstitutionGroup.fromJson(Map<String, dynamic> json) =>
      _$InstitutionGroupFromJson(json);

  @override
  @JsonKey(name: '@id')
  final String? id;
  @override
  @JsonKey(name: '@type')
  final String? type;
  @override
  final String? name;

  /// Create a copy of InstitutionGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InstitutionGroupCopyWith<_InstitutionGroup> get copyWith =>
      __$InstitutionGroupCopyWithImpl<_InstitutionGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InstitutionGroupToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InstitutionGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, name);

  @override
  String toString() {
    return 'InstitutionGroup(id: $id, type: $type, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$InstitutionGroupCopyWith<$Res>
    implements $InstitutionGroupCopyWith<$Res> {
  factory _$InstitutionGroupCopyWith(
          _InstitutionGroup value, $Res Function(_InstitutionGroup) _then) =
      __$InstitutionGroupCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String? id,
      @JsonKey(name: '@type') String? type,
      String? name});
}

/// @nodoc
class __$InstitutionGroupCopyWithImpl<$Res>
    implements _$InstitutionGroupCopyWith<$Res> {
  __$InstitutionGroupCopyWithImpl(this._self, this._then);

  final _InstitutionGroup _self;
  final $Res Function(_InstitutionGroup) _then;

  /// Create a copy of InstitutionGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? name = freezed,
  }) {
    return _then(_InstitutionGroup(
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
