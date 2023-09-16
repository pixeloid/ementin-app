// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return _Author.fromJson(json);
}

/// @nodoc
mixin _$Author {
  @JsonKey(name: '@id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int? get authorId => throw _privateConstructorUsedError;
  @JsonKey(name: '@type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: '@description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: '@presentations')
  List<ScheduleEvent>? get presentations => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<Workplace>? get workplaces => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorCopyWith<Author> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorCopyWith<$Res> {
  factory $AuthorCopyWith(Author value, $Res Function(Author) then) =
      _$AuthorCopyWithImpl<$Res, Author>;
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
class _$AuthorCopyWithImpl<$Res, $Val extends Author>
    implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      presentations: freezed == presentations
          ? _value.presentations
          : presentations // ignore: cast_nullable_to_non_nullable
              as List<ScheduleEvent>?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      workplaces: freezed == workplaces
          ? _value.workplaces
          : workplaces // ignore: cast_nullable_to_non_nullable
              as List<Workplace>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthorCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$$_AuthorCopyWith(_$_Author value, $Res Function(_$_Author) then) =
      __$$_AuthorCopyWithImpl<$Res>;
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
class __$$_AuthorCopyWithImpl<$Res>
    extends _$AuthorCopyWithImpl<$Res, _$_Author>
    implements _$$_AuthorCopyWith<$Res> {
  __$$_AuthorCopyWithImpl(_$_Author _value, $Res Function(_$_Author) _then)
      : super(_value, _then);

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
    return _then(_$_Author(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      presentations: freezed == presentations
          ? _value._presentations
          : presentations // ignore: cast_nullable_to_non_nullable
              as List<ScheduleEvent>?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      workplaces: freezed == workplaces
          ? _value._workplaces
          : workplaces // ignore: cast_nullable_to_non_nullable
              as List<Workplace>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Author extends _Author {
  _$_Author(
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

  factory _$_Author.fromJson(Map<String, dynamic> json) =>
      _$$_AuthorFromJson(json);

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

  @override
  String toString() {
    return 'Author(id: $id, authorId: $authorId, type: $type, description: $description, presentations: $presentations, name: $name, image: $image, workplaces: $workplaces)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Author &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthorCopyWith<_$_Author> get copyWith =>
      __$$_AuthorCopyWithImpl<_$_Author>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthorToJson(
      this,
    );
  }
}

abstract class _Author extends Author {
  factory _Author(
      {@JsonKey(name: '@id') final String? id,
      @JsonKey(name: 'id') final int? authorId,
      @JsonKey(name: '@type') final String? type,
      @JsonKey(name: '@description') final String? description,
      @JsonKey(name: '@presentations') final List<ScheduleEvent>? presentations,
      required final String name,
      final String? image,
      final List<Workplace>? workplaces}) = _$_Author;
  _Author._() : super._();

  factory _Author.fromJson(Map<String, dynamic> json) = _$_Author.fromJson;

  @override
  @JsonKey(name: '@id')
  String? get id;
  @override
  @JsonKey(name: 'id')
  int? get authorId;
  @override
  @JsonKey(name: '@type')
  String? get type;
  @override
  @JsonKey(name: '@description')
  String? get description;
  @override
  @JsonKey(name: '@presentations')
  List<ScheduleEvent>? get presentations;
  @override
  String get name;
  @override
  String? get image;
  @override
  List<Workplace>? get workplaces;
  @override
  @JsonKey(ignore: true)
  _$$_AuthorCopyWith<_$_Author> get copyWith =>
      throw _privateConstructorUsedError;
}
