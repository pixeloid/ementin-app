// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProgramItemModel _$ProgramItemModelFromJson(Map<String, dynamic> json) {
  return _ProgramItemModel.fromJson(json);
}

/// @nodoc
mixin _$ProgramItemModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: '@id')
  String get iri => throw _privateConstructorUsedError;
  List<ProgramItemModel> get children => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'from')
  DateTime get start => throw _privateConstructorUsedError;
  @JsonKey(name: 'to')
  DateTime get end => throw _privateConstructorUsedError;
  bool? get isFavourite => throw _privateConstructorUsedError;
  ProgramPresentationRateModel? get rate => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  String? get chairs => throw _privateConstructorUsedError;
  List<AuthorModel> get people => throw _privateConstructorUsedError;
  double? get rateValue => throw _privateConstructorUsedError;
  bool get isRatable => throw _privateConstructorUsedError;
  bool get isTimeHidden => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgramItemModelCopyWith<ProgramItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramItemModelCopyWith<$Res> {
  factory $ProgramItemModelCopyWith(
          ProgramItemModel value, $Res Function(ProgramItemModel) then) =
      _$ProgramItemModelCopyWithImpl<$Res, ProgramItemModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: '@id') String iri,
      List<ProgramItemModel> children,
      Duration duration,
      String title,
      @JsonKey(name: 'from') DateTime start,
      @JsonKey(name: 'to') DateTime end,
      bool? isFavourite,
      ProgramPresentationRateModel? rate,
      String? type,
      String? body,
      String? chairs,
      List<AuthorModel> people,
      double? rateValue,
      bool isRatable,
      bool isTimeHidden});
}

/// @nodoc
class _$ProgramItemModelCopyWithImpl<$Res, $Val extends ProgramItemModel>
    implements $ProgramItemModelCopyWith<$Res> {
  _$ProgramItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? iri = null,
    Object? children = null,
    Object? duration = null,
    Object? title = null,
    Object? start = null,
    Object? end = null,
    Object? isFavourite = freezed,
    Object? rate = freezed,
    Object? type = freezed,
    Object? body = freezed,
    Object? chairs = freezed,
    Object? people = null,
    Object? rateValue = freezed,
    Object? isRatable = null,
    Object? isTimeHidden = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      iri: null == iri
          ? _value.iri
          : iri // ignore: cast_nullable_to_non_nullable
              as String,
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ProgramItemModel>,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFavourite: freezed == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as ProgramPresentationRateModel?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      chairs: freezed == chairs
          ? _value.chairs
          : chairs // ignore: cast_nullable_to_non_nullable
              as String?,
      people: null == people
          ? _value.people
          : people // ignore: cast_nullable_to_non_nullable
              as List<AuthorModel>,
      rateValue: freezed == rateValue
          ? _value.rateValue
          : rateValue // ignore: cast_nullable_to_non_nullable
              as double?,
      isRatable: null == isRatable
          ? _value.isRatable
          : isRatable // ignore: cast_nullable_to_non_nullable
              as bool,
      isTimeHidden: null == isTimeHidden
          ? _value.isTimeHidden
          : isTimeHidden // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProgramItemModelCopyWith<$Res>
    implements $ProgramItemModelCopyWith<$Res> {
  factory _$$_ProgramItemModelCopyWith(
          _$_ProgramItemModel value, $Res Function(_$_ProgramItemModel) then) =
      __$$_ProgramItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: '@id') String iri,
      List<ProgramItemModel> children,
      Duration duration,
      String title,
      @JsonKey(name: 'from') DateTime start,
      @JsonKey(name: 'to') DateTime end,
      bool? isFavourite,
      ProgramPresentationRateModel? rate,
      String? type,
      String? body,
      String? chairs,
      List<AuthorModel> people,
      double? rateValue,
      bool isRatable,
      bool isTimeHidden});
}

/// @nodoc
class __$$_ProgramItemModelCopyWithImpl<$Res>
    extends _$ProgramItemModelCopyWithImpl<$Res, _$_ProgramItemModel>
    implements _$$_ProgramItemModelCopyWith<$Res> {
  __$$_ProgramItemModelCopyWithImpl(
      _$_ProgramItemModel _value, $Res Function(_$_ProgramItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? iri = null,
    Object? children = null,
    Object? duration = null,
    Object? title = null,
    Object? start = null,
    Object? end = null,
    Object? isFavourite = freezed,
    Object? rate = freezed,
    Object? type = freezed,
    Object? body = freezed,
    Object? chairs = freezed,
    Object? people = null,
    Object? rateValue = freezed,
    Object? isRatable = null,
    Object? isTimeHidden = null,
  }) {
    return _then(_$_ProgramItemModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      iri: null == iri
          ? _value.iri
          : iri // ignore: cast_nullable_to_non_nullable
              as String,
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ProgramItemModel>,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFavourite: freezed == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as ProgramPresentationRateModel?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      chairs: freezed == chairs
          ? _value.chairs
          : chairs // ignore: cast_nullable_to_non_nullable
              as String?,
      people: null == people
          ? _value._people
          : people // ignore: cast_nullable_to_non_nullable
              as List<AuthorModel>,
      rateValue: freezed == rateValue
          ? _value.rateValue
          : rateValue // ignore: cast_nullable_to_non_nullable
              as double?,
      isRatable: null == isRatable
          ? _value.isRatable
          : isRatable // ignore: cast_nullable_to_non_nullable
              as bool,
      isTimeHidden: null == isTimeHidden
          ? _value.isTimeHidden
          : isTimeHidden // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProgramItemModel extends _ProgramItemModel
    with DiagnosticableTreeMixin {
  _$_ProgramItemModel(
      {required this.id,
      @JsonKey(name: '@id') this.iri = '',
      final List<ProgramItemModel> children = const [],
      this.duration = const Duration(minutes: 0),
      required this.title,
      @JsonKey(name: 'from') required this.start,
      @JsonKey(name: 'to') required this.end,
      this.isFavourite,
      this.rate,
      this.type,
      this.body,
      this.chairs,
      final List<AuthorModel> people = const [],
      this.rateValue,
      this.isRatable = false,
      this.isTimeHidden = false})
      : _children = children,
        _people = people,
        super._();

  factory _$_ProgramItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProgramItemModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: '@id')
  final String iri;
  final List<ProgramItemModel> _children;
  @override
  @JsonKey()
  List<ProgramItemModel> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  @JsonKey()
  final Duration duration;
  @override
  final String title;
  @override
  @JsonKey(name: 'from')
  final DateTime start;
  @override
  @JsonKey(name: 'to')
  final DateTime end;
  @override
  final bool? isFavourite;
  @override
  final ProgramPresentationRateModel? rate;
  @override
  final String? type;
  @override
  final String? body;
  @override
  final String? chairs;
  final List<AuthorModel> _people;
  @override
  @JsonKey()
  List<AuthorModel> get people {
    if (_people is EqualUnmodifiableListView) return _people;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_people);
  }

  @override
  final double? rateValue;
  @override
  @JsonKey()
  final bool isRatable;
  @override
  @JsonKey()
  final bool isTimeHidden;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProgramItemModel(id: $id, iri: $iri, children: $children, duration: $duration, title: $title, start: $start, end: $end, isFavourite: $isFavourite, rate: $rate, type: $type, body: $body, chairs: $chairs, people: $people, rateValue: $rateValue, isRatable: $isRatable, isTimeHidden: $isTimeHidden)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProgramItemModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('iri', iri))
      ..add(DiagnosticsProperty('children', children))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('end', end))
      ..add(DiagnosticsProperty('isFavourite', isFavourite))
      ..add(DiagnosticsProperty('rate', rate))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('chairs', chairs))
      ..add(DiagnosticsProperty('people', people))
      ..add(DiagnosticsProperty('rateValue', rateValue))
      ..add(DiagnosticsProperty('isRatable', isRatable))
      ..add(DiagnosticsProperty('isTimeHidden', isTimeHidden));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProgramItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.iri, iri) || other.iri == iri) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.chairs, chairs) || other.chairs == chairs) &&
            const DeepCollectionEquality().equals(other._people, _people) &&
            (identical(other.rateValue, rateValue) ||
                other.rateValue == rateValue) &&
            (identical(other.isRatable, isRatable) ||
                other.isRatable == isRatable) &&
            (identical(other.isTimeHidden, isTimeHidden) ||
                other.isTimeHidden == isTimeHidden));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      iri,
      const DeepCollectionEquality().hash(_children),
      duration,
      title,
      start,
      end,
      isFavourite,
      rate,
      type,
      body,
      chairs,
      const DeepCollectionEquality().hash(_people),
      rateValue,
      isRatable,
      isTimeHidden);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProgramItemModelCopyWith<_$_ProgramItemModel> get copyWith =>
      __$$_ProgramItemModelCopyWithImpl<_$_ProgramItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProgramItemModelToJson(
      this,
    );
  }
}

abstract class _ProgramItemModel extends ProgramItemModel {
  factory _ProgramItemModel(
      {required final int id,
      @JsonKey(name: '@id') final String iri,
      final List<ProgramItemModel> children,
      final Duration duration,
      required final String title,
      @JsonKey(name: 'from') required final DateTime start,
      @JsonKey(name: 'to') required final DateTime end,
      final bool? isFavourite,
      final ProgramPresentationRateModel? rate,
      final String? type,
      final String? body,
      final String? chairs,
      final List<AuthorModel> people,
      final double? rateValue,
      final bool isRatable,
      final bool isTimeHidden}) = _$_ProgramItemModel;
  _ProgramItemModel._() : super._();

  factory _ProgramItemModel.fromJson(Map<String, dynamic> json) =
      _$_ProgramItemModel.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: '@id')
  String get iri;
  @override
  List<ProgramItemModel> get children;
  @override
  Duration get duration;
  @override
  String get title;
  @override
  @JsonKey(name: 'from')
  DateTime get start;
  @override
  @JsonKey(name: 'to')
  DateTime get end;
  @override
  bool? get isFavourite;
  @override
  ProgramPresentationRateModel? get rate;
  @override
  String? get type;
  @override
  String? get body;
  @override
  String? get chairs;
  @override
  List<AuthorModel> get people;
  @override
  double? get rateValue;
  @override
  bool get isRatable;
  @override
  bool get isTimeHidden;
  @override
  @JsonKey(ignore: true)
  _$$_ProgramItemModelCopyWith<_$_ProgramItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
