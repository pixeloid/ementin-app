// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return _Schedule.fromJson(json);
}

/// @nodoc
mixin _$Schedule {
  @JsonKey(name: "@context")
  String get context => throw _privateConstructorUsedError;
  @JsonKey(name: "@id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "@type")
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: "halls")
  List<Hall> get halls => throw _privateConstructorUsedError;
  @JsonKey(name: "days")
  List<Day> get days => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleCopyWith<Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) then) =
      _$ScheduleCopyWithImpl<$Res, Schedule>;
  @useResult
  $Res call(
      {@JsonKey(name: "@context") String context,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "@type") String type,
      @JsonKey(name: "halls") List<Hall> halls,
      @JsonKey(name: "days") List<Day> days});
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res, $Val extends Schedule>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? id = null,
    Object? type = null,
    Object? halls = null,
    Object? days = null,
  }) {
    return _then(_value.copyWith(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      halls: null == halls
          ? _value.halls
          : halls // ignore: cast_nullable_to_non_nullable
              as List<Hall>,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<Day>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScheduleCopyWith<$Res> implements $ScheduleCopyWith<$Res> {
  factory _$$_ScheduleCopyWith(
          _$_Schedule value, $Res Function(_$_Schedule) then) =
      __$$_ScheduleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "@context") String context,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "@type") String type,
      @JsonKey(name: "halls") List<Hall> halls,
      @JsonKey(name: "days") List<Day> days});
}

/// @nodoc
class __$$_ScheduleCopyWithImpl<$Res>
    extends _$ScheduleCopyWithImpl<$Res, _$_Schedule>
    implements _$$_ScheduleCopyWith<$Res> {
  __$$_ScheduleCopyWithImpl(
      _$_Schedule _value, $Res Function(_$_Schedule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? id = null,
    Object? type = null,
    Object? halls = null,
    Object? days = null,
  }) {
    return _then(_$_Schedule(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      halls: null == halls
          ? _value._halls
          : halls // ignore: cast_nullable_to_non_nullable
              as List<Hall>,
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<Day>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Schedule implements _Schedule {
  const _$_Schedule(
      {@JsonKey(name: "@context") required this.context,
      @JsonKey(name: "@id") required this.id,
      @JsonKey(name: "@type") required this.type,
      @JsonKey(name: "halls") required final List<Hall> halls,
      @JsonKey(name: "days") required final List<Day> days})
      : _halls = halls,
        _days = days;

  factory _$_Schedule.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleFromJson(json);

  @override
  @JsonKey(name: "@context")
  final String context;
  @override
  @JsonKey(name: "@id")
  final String id;
  @override
  @JsonKey(name: "@type")
  final String type;
  final List<Hall> _halls;
  @override
  @JsonKey(name: "halls")
  List<Hall> get halls {
    if (_halls is EqualUnmodifiableListView) return _halls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_halls);
  }

  final List<Day> _days;
  @override
  @JsonKey(name: "days")
  List<Day> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'Schedule(context: $context, id: $id, type: $type, halls: $halls, days: $days)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Schedule &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._halls, _halls) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      context,
      id,
      type,
      const DeepCollectionEquality().hash(_halls),
      const DeepCollectionEquality().hash(_days));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScheduleCopyWith<_$_Schedule> get copyWith =>
      __$$_ScheduleCopyWithImpl<_$_Schedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleToJson(
      this,
    );
  }
}

abstract class _Schedule implements Schedule {
  const factory _Schedule(
      {@JsonKey(name: "@context") required final String context,
      @JsonKey(name: "@id") required final String id,
      @JsonKey(name: "@type") required final String type,
      @JsonKey(name: "halls") required final List<Hall> halls,
      @JsonKey(name: "days") required final List<Day> days}) = _$_Schedule;

  factory _Schedule.fromJson(Map<String, dynamic> json) = _$_Schedule.fromJson;

  @override
  @JsonKey(name: "@context")
  String get context;
  @override
  @JsonKey(name: "@id")
  String get id;
  @override
  @JsonKey(name: "@type")
  String get type;
  @override
  @JsonKey(name: "halls")
  List<Hall> get halls;
  @override
  @JsonKey(name: "days")
  List<Day> get days;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduleCopyWith<_$_Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

Day _$DayFromJson(Map<String, dynamic> json) {
  return _Day.fromJson(json);
}

/// @nodoc
mixin _$Day {
  @JsonKey(name: "@type")
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: "@id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "date")
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: "eventGroups")
  List<EventGroup> get eventGroups => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DayCopyWith<Day> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayCopyWith<$Res> {
  factory $DayCopyWith(Day value, $Res Function(Day) then) =
      _$DayCopyWithImpl<$Res, Day>;
  @useResult
  $Res call(
      {@JsonKey(name: "@type") String type,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "date") DateTime date,
      @JsonKey(name: "eventGroups") List<EventGroup> eventGroups});
}

/// @nodoc
class _$DayCopyWithImpl<$Res, $Val extends Day> implements $DayCopyWith<$Res> {
  _$DayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? date = null,
    Object? eventGroups = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventGroups: null == eventGroups
          ? _value.eventGroups
          : eventGroups // ignore: cast_nullable_to_non_nullable
              as List<EventGroup>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DayCopyWith<$Res> implements $DayCopyWith<$Res> {
  factory _$$_DayCopyWith(_$_Day value, $Res Function(_$_Day) then) =
      __$$_DayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "@type") String type,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "date") DateTime date,
      @JsonKey(name: "eventGroups") List<EventGroup> eventGroups});
}

/// @nodoc
class __$$_DayCopyWithImpl<$Res> extends _$DayCopyWithImpl<$Res, _$_Day>
    implements _$$_DayCopyWith<$Res> {
  __$$_DayCopyWithImpl(_$_Day _value, $Res Function(_$_Day) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? date = null,
    Object? eventGroups = null,
  }) {
    return _then(_$_Day(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventGroups: null == eventGroups
          ? _value._eventGroups
          : eventGroups // ignore: cast_nullable_to_non_nullable
              as List<EventGroup>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Day implements _Day {
  const _$_Day(
      {@JsonKey(name: "@type") required this.type,
      @JsonKey(name: "@id") required this.id,
      @JsonKey(name: "date") required this.date,
      @JsonKey(name: "eventGroups")
      required final List<EventGroup> eventGroups})
      : _eventGroups = eventGroups;

  factory _$_Day.fromJson(Map<String, dynamic> json) => _$$_DayFromJson(json);

  @override
  @JsonKey(name: "@type")
  final String type;
  @override
  @JsonKey(name: "@id")
  final String id;
  @override
  @JsonKey(name: "date")
  final DateTime date;
  final List<EventGroup> _eventGroups;
  @override
  @JsonKey(name: "eventGroups")
  List<EventGroup> get eventGroups {
    if (_eventGroups is EqualUnmodifiableListView) return _eventGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eventGroups);
  }

  @override
  String toString() {
    return 'Day(type: $type, id: $id, date: $date, eventGroups: $eventGroups)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Day &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._eventGroups, _eventGroups));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, id, date,
      const DeepCollectionEquality().hash(_eventGroups));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DayCopyWith<_$_Day> get copyWith =>
      __$$_DayCopyWithImpl<_$_Day>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DayToJson(
      this,
    );
  }
}

abstract class _Day implements Day {
  const factory _Day(
      {@JsonKey(name: "@type") required final String type,
      @JsonKey(name: "@id") required final String id,
      @JsonKey(name: "date") required final DateTime date,
      @JsonKey(name: "eventGroups")
      required final List<EventGroup> eventGroups}) = _$_Day;

  factory _Day.fromJson(Map<String, dynamic> json) = _$_Day.fromJson;

  @override
  @JsonKey(name: "@type")
  String get type;
  @override
  @JsonKey(name: "@id")
  String get id;
  @override
  @JsonKey(name: "date")
  DateTime get date;
  @override
  @JsonKey(name: "eventGroups")
  List<EventGroup> get eventGroups;
  @override
  @JsonKey(ignore: true)
  _$$_DayCopyWith<_$_Day> get copyWith => throw _privateConstructorUsedError;
}

EventGroup _$EventGroupFromJson(Map<String, dynamic> json) {
  return _EventGroup.fromJson(json);
}

/// @nodoc
mixin _$EventGroup {
  @JsonKey(name: "@type")
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: "@id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "columns")
  List<Hall> get columns => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventGroupCopyWith<EventGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventGroupCopyWith<$Res> {
  factory $EventGroupCopyWith(
          EventGroup value, $Res Function(EventGroup) then) =
      _$EventGroupCopyWithImpl<$Res, EventGroup>;
  @useResult
  $Res call(
      {@JsonKey(name: "@type") String type,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "columns") List<Hall> columns});
}

/// @nodoc
class _$EventGroupCopyWithImpl<$Res, $Val extends EventGroup>
    implements $EventGroupCopyWith<$Res> {
  _$EventGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? columns = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      columns: null == columns
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as List<Hall>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventGroupCopyWith<$Res>
    implements $EventGroupCopyWith<$Res> {
  factory _$$_EventGroupCopyWith(
          _$_EventGroup value, $Res Function(_$_EventGroup) then) =
      __$$_EventGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "@type") String type,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "columns") List<Hall> columns});
}

/// @nodoc
class __$$_EventGroupCopyWithImpl<$Res>
    extends _$EventGroupCopyWithImpl<$Res, _$_EventGroup>
    implements _$$_EventGroupCopyWith<$Res> {
  __$$_EventGroupCopyWithImpl(
      _$_EventGroup _value, $Res Function(_$_EventGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? columns = null,
  }) {
    return _then(_$_EventGroup(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      columns: null == columns
          ? _value._columns
          : columns // ignore: cast_nullable_to_non_nullable
              as List<Hall>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventGroup implements _EventGroup {
  const _$_EventGroup(
      {@JsonKey(name: "@type") required this.type,
      @JsonKey(name: "@id") required this.id,
      @JsonKey(name: "columns") required final List<Hall> columns})
      : _columns = columns;

  factory _$_EventGroup.fromJson(Map<String, dynamic> json) =>
      _$$_EventGroupFromJson(json);

  @override
  @JsonKey(name: "@type")
  final String type;
  @override
  @JsonKey(name: "@id")
  final String id;
  final List<Hall> _columns;
  @override
  @JsonKey(name: "columns")
  List<Hall> get columns {
    if (_columns is EqualUnmodifiableListView) return _columns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_columns);
  }

  @override
  String toString() {
    return 'EventGroup(type: $type, id: $id, columns: $columns)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventGroup &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._columns, _columns));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, id, const DeepCollectionEquality().hash(_columns));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventGroupCopyWith<_$_EventGroup> get copyWith =>
      __$$_EventGroupCopyWithImpl<_$_EventGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventGroupToJson(
      this,
    );
  }
}

abstract class _EventGroup implements EventGroup {
  const factory _EventGroup(
          {@JsonKey(name: "@type") required final String type,
          @JsonKey(name: "@id") required final String id,
          @JsonKey(name: "columns") required final List<Hall> columns}) =
      _$_EventGroup;

  factory _EventGroup.fromJson(Map<String, dynamic> json) =
      _$_EventGroup.fromJson;

  @override
  @JsonKey(name: "@type")
  String get type;
  @override
  @JsonKey(name: "@id")
  String get id;
  @override
  @JsonKey(name: "columns")
  List<Hall> get columns;
  @override
  @JsonKey(ignore: true)
  _$$_EventGroupCopyWith<_$_EventGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

Hall _$HallFromJson(Map<String, dynamic> json) {
  return _Hall.fromJson(json);
}

/// @nodoc
mixin _$Hall {
  @JsonKey(name: "@type")
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: "@id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "events")
  List<ScheduleEvent>? get events => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "accomodation")
  Hall? get accomodation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HallCopyWith<Hall> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HallCopyWith<$Res> {
  factory $HallCopyWith(Hall value, $Res Function(Hall) then) =
      _$HallCopyWithImpl<$Res, Hall>;
  @useResult
  $Res call(
      {@JsonKey(name: "@type") String type,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "events") List<ScheduleEvent>? events,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "accomodation") Hall? accomodation});

  $HallCopyWith<$Res>? get accomodation;
}

/// @nodoc
class _$HallCopyWithImpl<$Res, $Val extends Hall>
    implements $HallCopyWith<$Res> {
  _$HallCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? events = freezed,
    Object? name = freezed,
    Object? accomodation = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      events: freezed == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<ScheduleEvent>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      accomodation: freezed == accomodation
          ? _value.accomodation
          : accomodation // ignore: cast_nullable_to_non_nullable
              as Hall?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HallCopyWith<$Res>? get accomodation {
    if (_value.accomodation == null) {
      return null;
    }

    return $HallCopyWith<$Res>(_value.accomodation!, (value) {
      return _then(_value.copyWith(accomodation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HallCopyWith<$Res> implements $HallCopyWith<$Res> {
  factory _$$_HallCopyWith(_$_Hall value, $Res Function(_$_Hall) then) =
      __$$_HallCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "@type") String type,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "events") List<ScheduleEvent>? events,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "accomodation") Hall? accomodation});

  @override
  $HallCopyWith<$Res>? get accomodation;
}

/// @nodoc
class __$$_HallCopyWithImpl<$Res> extends _$HallCopyWithImpl<$Res, _$_Hall>
    implements _$$_HallCopyWith<$Res> {
  __$$_HallCopyWithImpl(_$_Hall _value, $Res Function(_$_Hall) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? events = freezed,
    Object? name = freezed,
    Object? accomodation = freezed,
  }) {
    return _then(_$_Hall(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      events: freezed == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<ScheduleEvent>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      accomodation: freezed == accomodation
          ? _value.accomodation
          : accomodation // ignore: cast_nullable_to_non_nullable
              as Hall?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Hall implements _Hall {
  const _$_Hall(
      {@JsonKey(name: "@type") required this.type,
      @JsonKey(name: "@id") required this.id,
      @JsonKey(name: "events") final List<ScheduleEvent>? events,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "accomodation") this.accomodation})
      : _events = events;

  factory _$_Hall.fromJson(Map<String, dynamic> json) => _$$_HallFromJson(json);

  @override
  @JsonKey(name: "@type")
  final String type;
  @override
  @JsonKey(name: "@id")
  final String id;
  final List<ScheduleEvent>? _events;
  @override
  @JsonKey(name: "events")
  List<ScheduleEvent>? get events {
    final value = _events;
    if (value == null) return null;
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "accomodation")
  final Hall? accomodation;

  @override
  String toString() {
    return 'Hall(type: $type, id: $id, events: $events, name: $name, accomodation: $accomodation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Hall &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.accomodation, accomodation) ||
                other.accomodation == accomodation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, id,
      const DeepCollectionEquality().hash(_events), name, accomodation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HallCopyWith<_$_Hall> get copyWith =>
      __$$_HallCopyWithImpl<_$_Hall>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HallToJson(
      this,
    );
  }
}

abstract class _Hall implements Hall {
  const factory _Hall(
      {@JsonKey(name: "@type") required final String type,
      @JsonKey(name: "@id") required final String id,
      @JsonKey(name: "events") final List<ScheduleEvent>? events,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "accomodation") final Hall? accomodation}) = _$_Hall;

  factory _Hall.fromJson(Map<String, dynamic> json) = _$_Hall.fromJson;

  @override
  @JsonKey(name: "@type")
  String get type;
  @override
  @JsonKey(name: "@id")
  String get id;
  @override
  @JsonKey(name: "events")
  List<ScheduleEvent>? get events;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "accomodation")
  Hall? get accomodation;
  @override
  @JsonKey(ignore: true)
  _$$_HallCopyWith<_$_Hall> get copyWith => throw _privateConstructorUsedError;
}

ScheduleEvent _$ScheduleEventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$ScheduleEvent {
  @JsonKey(name: "@type")
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: "@id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "id")
  int get eventId => throw _privateConstructorUsedError;
  @JsonKey(name: "class")
  String get eventClass => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "start")
  DateTime get start => throw _privateConstructorUsedError;
  @JsonKey(name: "end")
  DateTime get end => throw _privateConstructorUsedError;
  @JsonKey(name: "children")
  List<ScheduleEvent> get children => throw _privateConstructorUsedError;
  @JsonKey(name: "favourite")
  int? get favourite => throw _privateConstructorUsedError;
  @JsonKey(name: "isTimeHidden")
  bool get isTimeHidden => throw _privateConstructorUsedError;
  @JsonKey(name: "isRatable")
  bool get isRatable => throw _privateConstructorUsedError;
  @JsonKey(name: "structuredAuthors")
  StructuredAuthors? get structuredAuthors =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "body")
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: "subtitle")
  String? get subtitle => throw _privateConstructorUsedError;
  @JsonKey(name: "chairs")
  String? get chairs => throw _privateConstructorUsedError;
  @JsonKey(name: "authors")
  List<Author>? get authors => throw _privateConstructorUsedError;
  @JsonKey(name: "rate")
  double? get rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleEventCopyWith<ScheduleEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleEventCopyWith<$Res> {
  factory $ScheduleEventCopyWith(
          ScheduleEvent value, $Res Function(ScheduleEvent) then) =
      _$ScheduleEventCopyWithImpl<$Res, ScheduleEvent>;
  @useResult
  $Res call(
      {@JsonKey(name: "@type") String type,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "id") int eventId,
      @JsonKey(name: "class") String eventClass,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "start") DateTime start,
      @JsonKey(name: "end") DateTime end,
      @JsonKey(name: "children") List<ScheduleEvent> children,
      @JsonKey(name: "favourite") int? favourite,
      @JsonKey(name: "isTimeHidden") bool isTimeHidden,
      @JsonKey(name: "isRatable") bool isRatable,
      @JsonKey(name: "structuredAuthors") StructuredAuthors? structuredAuthors,
      @JsonKey(name: "body") String? body,
      @JsonKey(name: "subtitle") String? subtitle,
      @JsonKey(name: "chairs") String? chairs,
      @JsonKey(name: "authors") List<Author>? authors,
      @JsonKey(name: "rate") double? rate});

  $StructuredAuthorsCopyWith<$Res>? get structuredAuthors;
}

/// @nodoc
class _$ScheduleEventCopyWithImpl<$Res, $Val extends ScheduleEvent>
    implements $ScheduleEventCopyWith<$Res> {
  _$ScheduleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? eventId = null,
    Object? eventClass = null,
    Object? title = null,
    Object? start = null,
    Object? end = null,
    Object? children = null,
    Object? favourite = freezed,
    Object? isTimeHidden = null,
    Object? isRatable = null,
    Object? structuredAuthors = freezed,
    Object? body = freezed,
    Object? subtitle = freezed,
    Object? chairs = freezed,
    Object? authors = freezed,
    Object? rate = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      eventClass: null == eventClass
          ? _value.eventClass
          : eventClass // ignore: cast_nullable_to_non_nullable
              as String,
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
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ScheduleEvent>,
      favourite: freezed == favourite
          ? _value.favourite
          : favourite // ignore: cast_nullable_to_non_nullable
              as int?,
      isTimeHidden: null == isTimeHidden
          ? _value.isTimeHidden
          : isTimeHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isRatable: null == isRatable
          ? _value.isRatable
          : isRatable // ignore: cast_nullable_to_non_nullable
              as bool,
      structuredAuthors: freezed == structuredAuthors
          ? _value.structuredAuthors
          : structuredAuthors // ignore: cast_nullable_to_non_nullable
              as StructuredAuthors?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      chairs: freezed == chairs
          ? _value.chairs
          : chairs // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Author>?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StructuredAuthorsCopyWith<$Res>? get structuredAuthors {
    if (_value.structuredAuthors == null) {
      return null;
    }

    return $StructuredAuthorsCopyWith<$Res>(_value.structuredAuthors!, (value) {
      return _then(_value.copyWith(structuredAuthors: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EventCopyWith<$Res> implements $ScheduleEventCopyWith<$Res> {
  factory _$$_EventCopyWith(_$_Event value, $Res Function(_$_Event) then) =
      __$$_EventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "@type") String type,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "id") int eventId,
      @JsonKey(name: "class") String eventClass,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "start") DateTime start,
      @JsonKey(name: "end") DateTime end,
      @JsonKey(name: "children") List<ScheduleEvent> children,
      @JsonKey(name: "favourite") int? favourite,
      @JsonKey(name: "isTimeHidden") bool isTimeHidden,
      @JsonKey(name: "isRatable") bool isRatable,
      @JsonKey(name: "structuredAuthors") StructuredAuthors? structuredAuthors,
      @JsonKey(name: "body") String? body,
      @JsonKey(name: "subtitle") String? subtitle,
      @JsonKey(name: "chairs") String? chairs,
      @JsonKey(name: "authors") List<Author>? authors,
      @JsonKey(name: "rate") double? rate});

  @override
  $StructuredAuthorsCopyWith<$Res>? get structuredAuthors;
}

/// @nodoc
class __$$_EventCopyWithImpl<$Res>
    extends _$ScheduleEventCopyWithImpl<$Res, _$_Event>
    implements _$$_EventCopyWith<$Res> {
  __$$_EventCopyWithImpl(_$_Event _value, $Res Function(_$_Event) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? eventId = null,
    Object? eventClass = null,
    Object? title = null,
    Object? start = null,
    Object? end = null,
    Object? children = null,
    Object? favourite = freezed,
    Object? isTimeHidden = null,
    Object? isRatable = null,
    Object? structuredAuthors = freezed,
    Object? body = freezed,
    Object? subtitle = freezed,
    Object? chairs = freezed,
    Object? authors = freezed,
    Object? rate = freezed,
  }) {
    return _then(_$_Event(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      eventClass: null == eventClass
          ? _value.eventClass
          : eventClass // ignore: cast_nullable_to_non_nullable
              as String,
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
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ScheduleEvent>,
      favourite: freezed == favourite
          ? _value.favourite
          : favourite // ignore: cast_nullable_to_non_nullable
              as int?,
      isTimeHidden: null == isTimeHidden
          ? _value.isTimeHidden
          : isTimeHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isRatable: null == isRatable
          ? _value.isRatable
          : isRatable // ignore: cast_nullable_to_non_nullable
              as bool,
      structuredAuthors: freezed == structuredAuthors
          ? _value.structuredAuthors
          : structuredAuthors // ignore: cast_nullable_to_non_nullable
              as StructuredAuthors?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      chairs: freezed == chairs
          ? _value.chairs
          : chairs // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Author>?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Event extends _Event {
  const _$_Event(
      {@JsonKey(name: "@type") required this.type,
      @JsonKey(name: "@id") required this.id,
      @JsonKey(name: "id") required this.eventId,
      @JsonKey(name: "class") required this.eventClass,
      @JsonKey(name: "title") required this.title,
      @JsonKey(name: "start") required this.start,
      @JsonKey(name: "end") required this.end,
      @JsonKey(name: "children") required final List<ScheduleEvent> children,
      @JsonKey(name: "favourite") this.favourite,
      @JsonKey(name: "isTimeHidden") required this.isTimeHidden,
      @JsonKey(name: "isRatable") required this.isRatable,
      @JsonKey(name: "structuredAuthors") this.structuredAuthors,
      @JsonKey(name: "body") this.body,
      @JsonKey(name: "subtitle") this.subtitle,
      @JsonKey(name: "chairs") this.chairs,
      @JsonKey(name: "authors") final List<Author>? authors,
      @JsonKey(name: "rate") required this.rate})
      : _children = children,
        _authors = authors,
        super._();

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$$_EventFromJson(json);

  @override
  @JsonKey(name: "@type")
  final String type;
  @override
  @JsonKey(name: "@id")
  final String id;
  @override
  @JsonKey(name: "id")
  final int eventId;
  @override
  @JsonKey(name: "class")
  final String eventClass;
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "start")
  final DateTime start;
  @override
  @JsonKey(name: "end")
  final DateTime end;
  final List<ScheduleEvent> _children;
  @override
  @JsonKey(name: "children")
  List<ScheduleEvent> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  @JsonKey(name: "favourite")
  final int? favourite;
  @override
  @JsonKey(name: "isTimeHidden")
  final bool isTimeHidden;
  @override
  @JsonKey(name: "isRatable")
  final bool isRatable;
  @override
  @JsonKey(name: "structuredAuthors")
  final StructuredAuthors? structuredAuthors;
  @override
  @JsonKey(name: "body")
  final String? body;
  @override
  @JsonKey(name: "subtitle")
  final String? subtitle;
  @override
  @JsonKey(name: "chairs")
  final String? chairs;
  final List<Author>? _authors;
  @override
  @JsonKey(name: "authors")
  List<Author>? get authors {
    final value = _authors;
    if (value == null) return null;
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "rate")
  final double? rate;

  @override
  String toString() {
    return 'ScheduleEvent(type: $type, id: $id, eventId: $eventId, eventClass: $eventClass, title: $title, start: $start, end: $end, children: $children, favourite: $favourite, isTimeHidden: $isTimeHidden, isRatable: $isRatable, structuredAuthors: $structuredAuthors, body: $body, subtitle: $subtitle, chairs: $chairs, authors: $authors, rate: $rate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Event &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.eventClass, eventClass) ||
                other.eventClass == eventClass) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.favourite, favourite) ||
                other.favourite == favourite) &&
            (identical(other.isTimeHidden, isTimeHidden) ||
                other.isTimeHidden == isTimeHidden) &&
            (identical(other.isRatable, isRatable) ||
                other.isRatable == isRatable) &&
            (identical(other.structuredAuthors, structuredAuthors) ||
                other.structuredAuthors == structuredAuthors) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.chairs, chairs) || other.chairs == chairs) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      id,
      eventId,
      eventClass,
      title,
      start,
      end,
      const DeepCollectionEquality().hash(_children),
      favourite,
      isTimeHidden,
      isRatable,
      structuredAuthors,
      body,
      subtitle,
      chairs,
      const DeepCollectionEquality().hash(_authors),
      rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventCopyWith<_$_Event> get copyWith =>
      __$$_EventCopyWithImpl<_$_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventToJson(
      this,
    );
  }
}

abstract class _Event extends ScheduleEvent {
  const factory _Event(
      {@JsonKey(name: "@type") required final String type,
      @JsonKey(name: "@id") required final String id,
      @JsonKey(name: "id") required final int eventId,
      @JsonKey(name: "class") required final String eventClass,
      @JsonKey(name: "title") required final String title,
      @JsonKey(name: "start") required final DateTime start,
      @JsonKey(name: "end") required final DateTime end,
      @JsonKey(name: "children") required final List<ScheduleEvent> children,
      @JsonKey(name: "favourite") final int? favourite,
      @JsonKey(name: "isTimeHidden") required final bool isTimeHidden,
      @JsonKey(name: "isRatable") required final bool isRatable,
      @JsonKey(name: "structuredAuthors")
      final StructuredAuthors? structuredAuthors,
      @JsonKey(name: "body") final String? body,
      @JsonKey(name: "subtitle") final String? subtitle,
      @JsonKey(name: "chairs") final String? chairs,
      @JsonKey(name: "authors") final List<Author>? authors,
      @JsonKey(name: "rate") required final double? rate}) = _$_Event;
  const _Event._() : super._();

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  @JsonKey(name: "@type")
  String get type;
  @override
  @JsonKey(name: "@id")
  String get id;
  @override
  @JsonKey(name: "id")
  int get eventId;
  @override
  @JsonKey(name: "class")
  String get eventClass;
  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "start")
  DateTime get start;
  @override
  @JsonKey(name: "end")
  DateTime get end;
  @override
  @JsonKey(name: "children")
  List<ScheduleEvent> get children;
  @override
  @JsonKey(name: "favourite")
  int? get favourite;
  @override
  @JsonKey(name: "isTimeHidden")
  bool get isTimeHidden;
  @override
  @JsonKey(name: "isRatable")
  bool get isRatable;
  @override
  @JsonKey(name: "structuredAuthors")
  StructuredAuthors? get structuredAuthors;
  @override
  @JsonKey(name: "body")
  String? get body;
  @override
  @JsonKey(name: "subtitle")
  String? get subtitle;
  @override
  @JsonKey(name: "chairs")
  String? get chairs;
  @override
  @JsonKey(name: "authors")
  List<Author>? get authors;
  @override
  @JsonKey(name: "rate")
  double? get rate;
  @override
  @JsonKey(ignore: true)
  _$$_EventCopyWith<_$_Event> get copyWith =>
      throw _privateConstructorUsedError;
}

StructuredAuthors _$StructuredAuthorsFromJson(Map<String, dynamic> json) {
  return _StructuredAuthors.fromJson(json);
}

/// @nodoc
mixin _$StructuredAuthors {
  @JsonKey(name: "@type")
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: "@id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "institutions")
  List<Institution> get institutions => throw _privateConstructorUsedError;
  @JsonKey(name: "names")
  List<Name> get names => throw _privateConstructorUsedError;
  @JsonKey(name: "hasMoreAuthors")
  bool get hasMoreAuthors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StructuredAuthorsCopyWith<StructuredAuthors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StructuredAuthorsCopyWith<$Res> {
  factory $StructuredAuthorsCopyWith(
          StructuredAuthors value, $Res Function(StructuredAuthors) then) =
      _$StructuredAuthorsCopyWithImpl<$Res, StructuredAuthors>;
  @useResult
  $Res call(
      {@JsonKey(name: "@type") String type,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "institutions") List<Institution> institutions,
      @JsonKey(name: "names") List<Name> names,
      @JsonKey(name: "hasMoreAuthors") bool hasMoreAuthors});
}

/// @nodoc
class _$StructuredAuthorsCopyWithImpl<$Res, $Val extends StructuredAuthors>
    implements $StructuredAuthorsCopyWith<$Res> {
  _$StructuredAuthorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? institutions = null,
    Object? names = null,
    Object? hasMoreAuthors = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      institutions: null == institutions
          ? _value.institutions
          : institutions // ignore: cast_nullable_to_non_nullable
              as List<Institution>,
      names: null == names
          ? _value.names
          : names // ignore: cast_nullable_to_non_nullable
              as List<Name>,
      hasMoreAuthors: null == hasMoreAuthors
          ? _value.hasMoreAuthors
          : hasMoreAuthors // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StructuredAuthorsCopyWith<$Res>
    implements $StructuredAuthorsCopyWith<$Res> {
  factory _$$_StructuredAuthorsCopyWith(_$_StructuredAuthors value,
          $Res Function(_$_StructuredAuthors) then) =
      __$$_StructuredAuthorsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "@type") String type,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "institutions") List<Institution> institutions,
      @JsonKey(name: "names") List<Name> names,
      @JsonKey(name: "hasMoreAuthors") bool hasMoreAuthors});
}

/// @nodoc
class __$$_StructuredAuthorsCopyWithImpl<$Res>
    extends _$StructuredAuthorsCopyWithImpl<$Res, _$_StructuredAuthors>
    implements _$$_StructuredAuthorsCopyWith<$Res> {
  __$$_StructuredAuthorsCopyWithImpl(
      _$_StructuredAuthors _value, $Res Function(_$_StructuredAuthors) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? institutions = null,
    Object? names = null,
    Object? hasMoreAuthors = null,
  }) {
    return _then(_$_StructuredAuthors(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      institutions: null == institutions
          ? _value._institutions
          : institutions // ignore: cast_nullable_to_non_nullable
              as List<Institution>,
      names: null == names
          ? _value._names
          : names // ignore: cast_nullable_to_non_nullable
              as List<Name>,
      hasMoreAuthors: null == hasMoreAuthors
          ? _value.hasMoreAuthors
          : hasMoreAuthors // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StructuredAuthors implements _StructuredAuthors {
  const _$_StructuredAuthors(
      {@JsonKey(name: "@type") required this.type,
      @JsonKey(name: "@id") required this.id,
      @JsonKey(name: "institutions")
      required final List<Institution> institutions,
      @JsonKey(name: "names") required final List<Name> names,
      @JsonKey(name: "hasMoreAuthors") required this.hasMoreAuthors})
      : _institutions = institutions,
        _names = names;

  factory _$_StructuredAuthors.fromJson(Map<String, dynamic> json) =>
      _$$_StructuredAuthorsFromJson(json);

  @override
  @JsonKey(name: "@type")
  final String type;
  @override
  @JsonKey(name: "@id")
  final String id;
  final List<Institution> _institutions;
  @override
  @JsonKey(name: "institutions")
  List<Institution> get institutions {
    if (_institutions is EqualUnmodifiableListView) return _institutions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_institutions);
  }

  final List<Name> _names;
  @override
  @JsonKey(name: "names")
  List<Name> get names {
    if (_names is EqualUnmodifiableListView) return _names;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_names);
  }

  @override
  @JsonKey(name: "hasMoreAuthors")
  final bool hasMoreAuthors;

  @override
  String toString() {
    return 'StructuredAuthors(type: $type, id: $id, institutions: $institutions, names: $names, hasMoreAuthors: $hasMoreAuthors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StructuredAuthors &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._institutions, _institutions) &&
            const DeepCollectionEquality().equals(other._names, _names) &&
            (identical(other.hasMoreAuthors, hasMoreAuthors) ||
                other.hasMoreAuthors == hasMoreAuthors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      id,
      const DeepCollectionEquality().hash(_institutions),
      const DeepCollectionEquality().hash(_names),
      hasMoreAuthors);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StructuredAuthorsCopyWith<_$_StructuredAuthors> get copyWith =>
      __$$_StructuredAuthorsCopyWithImpl<_$_StructuredAuthors>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StructuredAuthorsToJson(
      this,
    );
  }
}

abstract class _StructuredAuthors implements StructuredAuthors {
  const factory _StructuredAuthors(
      {@JsonKey(name: "@type") required final String type,
      @JsonKey(name: "@id") required final String id,
      @JsonKey(name: "institutions")
      required final List<Institution> institutions,
      @JsonKey(name: "names") required final List<Name> names,
      @JsonKey(name: "hasMoreAuthors")
      required final bool hasMoreAuthors}) = _$_StructuredAuthors;

  factory _StructuredAuthors.fromJson(Map<String, dynamic> json) =
      _$_StructuredAuthors.fromJson;

  @override
  @JsonKey(name: "@type")
  String get type;
  @override
  @JsonKey(name: "@id")
  String get id;
  @override
  @JsonKey(name: "institutions")
  List<Institution> get institutions;
  @override
  @JsonKey(name: "names")
  List<Name> get names;
  @override
  @JsonKey(name: "hasMoreAuthors")
  bool get hasMoreAuthors;
  @override
  @JsonKey(ignore: true)
  _$$_StructuredAuthorsCopyWith<_$_StructuredAuthors> get copyWith =>
      throw _privateConstructorUsedError;
}

Institution _$InstitutionFromJson(Map<String, dynamic> json) {
  return _Institution.fromJson(json);
}

/// @nodoc
mixin _$Institution {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "institution_id")
  int? get institutionId => throw _privateConstructorUsedError;
  @JsonKey(name: "need_fix")
  int? get needFix => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstitutionCopyWith<Institution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstitutionCopyWith<$Res> {
  factory $InstitutionCopyWith(
          Institution value, $Res Function(Institution) then) =
      _$InstitutionCopyWithImpl<$Res, Institution>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "institution_id") int? institutionId,
      @JsonKey(name: "need_fix") int? needFix});
}

/// @nodoc
class _$InstitutionCopyWithImpl<$Res, $Val extends Institution>
    implements $InstitutionCopyWith<$Res> {
  _$InstitutionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? institutionId = freezed,
    Object? needFix = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      institutionId: freezed == institutionId
          ? _value.institutionId
          : institutionId // ignore: cast_nullable_to_non_nullable
              as int?,
      needFix: freezed == needFix
          ? _value.needFix
          : needFix // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InstitutionCopyWith<$Res>
    implements $InstitutionCopyWith<$Res> {
  factory _$$_InstitutionCopyWith(
          _$_Institution value, $Res Function(_$_Institution) then) =
      __$$_InstitutionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "institution_id") int? institutionId,
      @JsonKey(name: "need_fix") int? needFix});
}

/// @nodoc
class __$$_InstitutionCopyWithImpl<$Res>
    extends _$InstitutionCopyWithImpl<$Res, _$_Institution>
    implements _$$_InstitutionCopyWith<$Res> {
  __$$_InstitutionCopyWithImpl(
      _$_Institution _value, $Res Function(_$_Institution) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? institutionId = freezed,
    Object? needFix = freezed,
  }) {
    return _then(_$_Institution(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      institutionId: freezed == institutionId
          ? _value.institutionId
          : institutionId // ignore: cast_nullable_to_non_nullable
              as int?,
      needFix: freezed == needFix
          ? _value.needFix
          : needFix // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Institution implements _Institution {
  const _$_Institution(
      {@JsonKey(name: "name") required this.name,
      @JsonKey(name: "institution_id") required this.institutionId,
      @JsonKey(name: "need_fix") required this.needFix});

  factory _$_Institution.fromJson(Map<String, dynamic> json) =>
      _$$_InstitutionFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "institution_id")
  final int? institutionId;
  @override
  @JsonKey(name: "need_fix")
  final int? needFix;

  @override
  String toString() {
    return 'Institution(name: $name, institutionId: $institutionId, needFix: $needFix)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Institution &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.institutionId, institutionId) ||
                other.institutionId == institutionId) &&
            (identical(other.needFix, needFix) || other.needFix == needFix));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, institutionId, needFix);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InstitutionCopyWith<_$_Institution> get copyWith =>
      __$$_InstitutionCopyWithImpl<_$_Institution>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InstitutionToJson(
      this,
    );
  }
}

abstract class _Institution implements Institution {
  const factory _Institution(
      {@JsonKey(name: "name") required final String? name,
      @JsonKey(name: "institution_id") required final int? institutionId,
      @JsonKey(name: "need_fix") required final int? needFix}) = _$_Institution;

  factory _Institution.fromJson(Map<String, dynamic> json) =
      _$_Institution.fromJson;

  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "institution_id")
  int? get institutionId;
  @override
  @JsonKey(name: "need_fix")
  int? get needFix;
  @override
  @JsonKey(ignore: true)
  _$$_InstitutionCopyWith<_$_Institution> get copyWith =>
      throw _privateConstructorUsedError;
}

Name _$NameFromJson(Map<String, dynamic> json) {
  return _Name.fromJson(json);
}

/// @nodoc
mixin _$Name {
  @JsonKey(name: "orig")
  List<dynamic> get orig => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "isPresenter")
  bool get isPresenter => throw _privateConstructorUsedError;
  @JsonKey(name: "profession")
  dynamic get profession => throw _privateConstructorUsedError;
  @JsonKey(name: "indexes")
  List<int> get indexes => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  dynamic get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NameCopyWith<Name> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameCopyWith<$Res> {
  factory $NameCopyWith(Name value, $Res Function(Name) then) =
      _$NameCopyWithImpl<$Res, Name>;
  @useResult
  $Res call(
      {@JsonKey(name: "orig") List<dynamic> orig,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "isPresenter") bool isPresenter,
      @JsonKey(name: "profession") dynamic profession,
      @JsonKey(name: "indexes") List<int> indexes,
      @JsonKey(name: "image") dynamic image});
}

/// @nodoc
class _$NameCopyWithImpl<$Res, $Val extends Name>
    implements $NameCopyWith<$Res> {
  _$NameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orig = null,
    Object? name = null,
    Object? isPresenter = null,
    Object? profession = freezed,
    Object? indexes = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      orig: null == orig
          ? _value.orig
          : orig // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isPresenter: null == isPresenter
          ? _value.isPresenter
          : isPresenter // ignore: cast_nullable_to_non_nullable
              as bool,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as dynamic,
      indexes: null == indexes
          ? _value.indexes
          : indexes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NameCopyWith<$Res> implements $NameCopyWith<$Res> {
  factory _$$_NameCopyWith(_$_Name value, $Res Function(_$_Name) then) =
      __$$_NameCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "orig") List<dynamic> orig,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "isPresenter") bool isPresenter,
      @JsonKey(name: "profession") dynamic profession,
      @JsonKey(name: "indexes") List<int> indexes,
      @JsonKey(name: "image") dynamic image});
}

/// @nodoc
class __$$_NameCopyWithImpl<$Res> extends _$NameCopyWithImpl<$Res, _$_Name>
    implements _$$_NameCopyWith<$Res> {
  __$$_NameCopyWithImpl(_$_Name _value, $Res Function(_$_Name) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orig = null,
    Object? name = null,
    Object? isPresenter = null,
    Object? profession = freezed,
    Object? indexes = null,
    Object? image = freezed,
  }) {
    return _then(_$_Name(
      orig: null == orig
          ? _value._orig
          : orig // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isPresenter: null == isPresenter
          ? _value.isPresenter
          : isPresenter // ignore: cast_nullable_to_non_nullable
              as bool,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as dynamic,
      indexes: null == indexes
          ? _value._indexes
          : indexes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Name implements _Name {
  const _$_Name(
      {@JsonKey(name: "orig") required final List<dynamic> orig,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "isPresenter") required this.isPresenter,
      @JsonKey(name: "profession") required this.profession,
      @JsonKey(name: "indexes") required final List<int> indexes,
      @JsonKey(name: "image") required this.image})
      : _orig = orig,
        _indexes = indexes;

  factory _$_Name.fromJson(Map<String, dynamic> json) => _$$_NameFromJson(json);

  final List<dynamic> _orig;
  @override
  @JsonKey(name: "orig")
  List<dynamic> get orig {
    if (_orig is EqualUnmodifiableListView) return _orig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orig);
  }

  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "isPresenter")
  final bool isPresenter;
  @override
  @JsonKey(name: "profession")
  final dynamic profession;
  final List<int> _indexes;
  @override
  @JsonKey(name: "indexes")
  List<int> get indexes {
    if (_indexes is EqualUnmodifiableListView) return _indexes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_indexes);
  }

  @override
  @JsonKey(name: "image")
  final dynamic image;

  @override
  String toString() {
    return 'Name(orig: $orig, name: $name, isPresenter: $isPresenter, profession: $profession, indexes: $indexes, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Name &&
            const DeepCollectionEquality().equals(other._orig, _orig) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isPresenter, isPresenter) ||
                other.isPresenter == isPresenter) &&
            const DeepCollectionEquality()
                .equals(other.profession, profession) &&
            const DeepCollectionEquality().equals(other._indexes, _indexes) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_orig),
      name,
      isPresenter,
      const DeepCollectionEquality().hash(profession),
      const DeepCollectionEquality().hash(_indexes),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NameCopyWith<_$_Name> get copyWith =>
      __$$_NameCopyWithImpl<_$_Name>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NameToJson(
      this,
    );
  }
}

abstract class _Name implements Name {
  const factory _Name(
      {@JsonKey(name: "orig") required final List<dynamic> orig,
      @JsonKey(name: "name") required final String name,
      @JsonKey(name: "isPresenter") required final bool isPresenter,
      @JsonKey(name: "profession") required final dynamic profession,
      @JsonKey(name: "indexes") required final List<int> indexes,
      @JsonKey(name: "image") required final dynamic image}) = _$_Name;

  factory _Name.fromJson(Map<String, dynamic> json) = _$_Name.fromJson;

  @override
  @JsonKey(name: "orig")
  List<dynamic> get orig;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "isPresenter")
  bool get isPresenter;
  @override
  @JsonKey(name: "profession")
  dynamic get profession;
  @override
  @JsonKey(name: "indexes")
  List<int> get indexes;
  @override
  @JsonKey(name: "image")
  dynamic get image;
  @override
  @JsonKey(ignore: true)
  _$$_NameCopyWith<_$_Name> get copyWith => throw _privateConstructorUsedError;
}
