// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthorModel _$AuthorModelFromJson(Map<String, dynamic> json) {
  return _AuthorModel.fromJson(json);
}

/// @nodoc
mixin _$AuthorModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: '@id')
  dynamic get iri => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get workplace => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<dynamic> get presentationIris => throw _privateConstructorUsedError;
  List<ProgramItemModel> get presentations =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorModelCopyWith<AuthorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorModelCopyWith<$Res> {
  factory $AuthorModelCopyWith(
          AuthorModel value, $Res Function(AuthorModel) then) =
      _$AuthorModelCopyWithImpl<$Res, AuthorModel>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: '@id') dynamic iri,
      String name,
      String? title,
      String? image,
      String? workplace,
      String? description,
      List<dynamic> presentationIris,
      List<ProgramItemModel> presentations});
}

/// @nodoc
class _$AuthorModelCopyWithImpl<$Res, $Val extends AuthorModel>
    implements $AuthorModelCopyWith<$Res> {
  _$AuthorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? iri = freezed,
    Object? name = null,
    Object? title = freezed,
    Object? image = freezed,
    Object? workplace = freezed,
    Object? description = freezed,
    Object? presentationIris = null,
    Object? presentations = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      iri: freezed == iri
          ? _value.iri
          : iri // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      workplace: freezed == workplace
          ? _value.workplace
          : workplace // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      presentationIris: null == presentationIris
          ? _value.presentationIris
          : presentationIris // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      presentations: null == presentations
          ? _value.presentations
          : presentations // ignore: cast_nullable_to_non_nullable
              as List<ProgramItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthorModelCopyWith<$Res>
    implements $AuthorModelCopyWith<$Res> {
  factory _$$_AuthorModelCopyWith(
          _$_AuthorModel value, $Res Function(_$_AuthorModel) then) =
      __$$_AuthorModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: '@id') dynamic iri,
      String name,
      String? title,
      String? image,
      String? workplace,
      String? description,
      List<dynamic> presentationIris,
      List<ProgramItemModel> presentations});
}

/// @nodoc
class __$$_AuthorModelCopyWithImpl<$Res>
    extends _$AuthorModelCopyWithImpl<$Res, _$_AuthorModel>
    implements _$$_AuthorModelCopyWith<$Res> {
  __$$_AuthorModelCopyWithImpl(
      _$_AuthorModel _value, $Res Function(_$_AuthorModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? iri = freezed,
    Object? name = null,
    Object? title = freezed,
    Object? image = freezed,
    Object? workplace = freezed,
    Object? description = freezed,
    Object? presentationIris = null,
    Object? presentations = null,
  }) {
    return _then(_$_AuthorModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      iri: freezed == iri ? _value.iri! : iri,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      workplace: freezed == workplace
          ? _value.workplace
          : workplace // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      presentationIris: null == presentationIris
          ? _value._presentationIris
          : presentationIris // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      presentations: null == presentations
          ? _value._presentations
          : presentations // ignore: cast_nullable_to_non_nullable
              as List<ProgramItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthorModel extends _AuthorModel {
  _$_AuthorModel(
      {this.id,
      @JsonKey(name: '@id') this.iri = '',
      required this.name,
      this.title,
      this.image,
      this.workplace,
      this.description,
      final List<dynamic> presentationIris = const [],
      final List<ProgramItemModel> presentations = const []})
      : _presentationIris = presentationIris,
        _presentations = presentations,
        super._();

  factory _$_AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$$_AuthorModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: '@id')
  final dynamic iri;
  @override
  final String name;
  @override
  final String? title;
  @override
  final String? image;
  @override
  final String? workplace;
  @override
  final String? description;
  final List<dynamic> _presentationIris;
  @override
  @JsonKey()
  List<dynamic> get presentationIris {
    if (_presentationIris is EqualUnmodifiableListView)
      return _presentationIris;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_presentationIris);
  }

  final List<ProgramItemModel> _presentations;
  @override
  @JsonKey()
  List<ProgramItemModel> get presentations {
    if (_presentations is EqualUnmodifiableListView) return _presentations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_presentations);
  }

  @override
  String toString() {
    return 'AuthorModel(id: $id, iri: $iri, name: $name, title: $title, image: $image, workplace: $workplace, description: $description, presentationIris: $presentationIris, presentations: $presentations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthorModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.iri, iri) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.workplace, workplace) ||
                other.workplace == workplace) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._presentationIris, _presentationIris) &&
            const DeepCollectionEquality()
                .equals(other._presentations, _presentations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(iri),
      name,
      title,
      image,
      workplace,
      description,
      const DeepCollectionEquality().hash(_presentationIris),
      const DeepCollectionEquality().hash(_presentations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthorModelCopyWith<_$_AuthorModel> get copyWith =>
      __$$_AuthorModelCopyWithImpl<_$_AuthorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthorModelToJson(
      this,
    );
  }
}

abstract class _AuthorModel extends AuthorModel {
  factory _AuthorModel(
      {final int? id,
      @JsonKey(name: '@id') final dynamic iri,
      required final String name,
      final String? title,
      final String? image,
      final String? workplace,
      final String? description,
      final List<dynamic> presentationIris,
      final List<ProgramItemModel> presentations}) = _$_AuthorModel;
  _AuthorModel._() : super._();

  factory _AuthorModel.fromJson(Map<String, dynamic> json) =
      _$_AuthorModel.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: '@id')
  dynamic get iri;
  @override
  String get name;
  @override
  String? get title;
  @override
  String? get image;
  @override
  String? get workplace;
  @override
  String? get description;
  @override
  List<dynamic> get presentationIris;
  @override
  List<ProgramItemModel> get presentations;
  @override
  @JsonKey(ignore: true)
  _$$_AuthorModelCopyWith<_$_AuthorModel> get copyWith =>
      throw _privateConstructorUsedError;
}
