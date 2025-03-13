// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Author {
  @JsonKey(name: '@id')
  String? get id;
  @JsonKey(name: 'id')
  int? get authorId;
  @JsonKey(name: '@type')
  String? get type;
  @JsonKey(name: '@description')
  String? get description;
  @JsonKey(name: '@presentations')
  List<ScheduleEvent>? get presentations;
  String get name;
  String? get image;
  List<Workplace>? get workplaces;

  /// Create a copy of Author
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthorCopyWith<Author> get copyWith =>
      _$AuthorCopyWithImpl<Author>(this as Author, _$identity);

  /// Serializes this Author to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Author &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.presentations, presentations) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other.workplaces, workplaces));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      authorId,
      type,
      description,
      const DeepCollectionEquality().hash(presentations),
      name,
      image,
      const DeepCollectionEquality().hash(workplaces));

  @override
  String toString() {
    return 'Author(id: $id, authorId: $authorId, type: $type, description: $description, presentations: $presentations, name: $name, image: $image, workplaces: $workplaces)';
  }
}

/// @nodoc
abstract mixin class $AuthorCopyWith<$Res> {
  factory $AuthorCopyWith(Author value, $Res Function(Author) _then) =
      _$AuthorCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String? id,
      @JsonKey(name: 'id') int? authorId,
      @JsonKey(name: '@type') String? type,
      @JsonKey(name: '@description') String? description,
      @JsonKey(name: '@presentations') List<ScheduleEvent>? presentations,
      String name,
      String? image,
      List<Workplace>? workplaces});
}

/// @nodoc
class _$AuthorCopyWithImpl<$Res> implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._self, this._then);

  final Author _self;
  final $Res Function(Author) _then;

  /// Create a copy of Author
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? authorId = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? presentations = freezed,
    Object? name = null,
    Object? image = freezed,
    Object? workplaces = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _self.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      presentations: freezed == presentations
          ? _self.presentations
          : presentations // ignore: cast_nullable_to_non_nullable
              as List<ScheduleEvent>?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      workplaces: freezed == workplaces
          ? _self.workplaces
          : workplaces // ignore: cast_nullable_to_non_nullable
              as List<Workplace>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Author extends Author {
  _Author(
      {@JsonKey(name: '@id') this.id,
      @JsonKey(name: 'id') this.authorId,
      @JsonKey(name: '@type') this.type,
      @JsonKey(name: '@description') this.description,
      @JsonKey(name: '@presentations') final List<ScheduleEvent>? presentations,
      required this.name,
      this.image,
      final List<Workplace>? workplaces})
      : _presentations = presentations,
        _workplaces = workplaces,
        super._();
  factory _Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  @override
  @JsonKey(name: '@id')
  final String? id;
  @override
  @JsonKey(name: 'id')
  final int? authorId;
  @override
  @JsonKey(name: '@type')
  final String? type;
  @override
  @JsonKey(name: '@description')
  final String? description;
  final List<ScheduleEvent>? _presentations;
  @override
  @JsonKey(name: '@presentations')
  List<ScheduleEvent>? get presentations {
    final value = _presentations;
    if (value == null) return null;
    if (_presentations is EqualUnmodifiableListView) return _presentations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String name;
  @override
  final String? image;
  final List<Workplace>? _workplaces;
  @override
  List<Workplace>? get workplaces {
    final value = _workplaces;
    if (value == null) return null;
    if (_workplaces is EqualUnmodifiableListView) return _workplaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of Author
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthorCopyWith<_Author> get copyWith =>
      __$AuthorCopyWithImpl<_Author>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuthorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Author &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._presentations, _presentations) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other._workplaces, _workplaces));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      authorId,
      type,
      description,
      const DeepCollectionEquality().hash(_presentations),
      name,
      image,
      const DeepCollectionEquality().hash(_workplaces));

  @override
  String toString() {
    return 'Author(id: $id, authorId: $authorId, type: $type, description: $description, presentations: $presentations, name: $name, image: $image, workplaces: $workplaces)';
  }
}

/// @nodoc
abstract mixin class _$AuthorCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$AuthorCopyWith(_Author value, $Res Function(_Author) _then) =
      __$AuthorCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String? id,
      @JsonKey(name: 'id') int? authorId,
      @JsonKey(name: '@type') String? type,
      @JsonKey(name: '@description') String? description,
      @JsonKey(name: '@presentations') List<ScheduleEvent>? presentations,
      String name,
      String? image,
      List<Workplace>? workplaces});
}

/// @nodoc
class __$AuthorCopyWithImpl<$Res> implements _$AuthorCopyWith<$Res> {
  __$AuthorCopyWithImpl(this._self, this._then);

  final _Author _self;
  final $Res Function(_Author) _then;

  /// Create a copy of Author
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? authorId = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? presentations = freezed,
    Object? name = null,
    Object? image = freezed,
    Object? workplaces = freezed,
  }) {
    return _then(_Author(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _self.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      presentations: freezed == presentations
          ? _self._presentations
          : presentations // ignore: cast_nullable_to_non_nullable
              as List<ScheduleEvent>?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      workplaces: freezed == workplaces
          ? _self._workplaces
          : workplaces // ignore: cast_nullable_to_non_nullable
              as List<Workplace>?,
    ));
  }
}

// dart format on
