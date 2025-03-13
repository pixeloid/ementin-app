// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Schedule {
  @JsonKey(name: "@context")
  String get context;
  @JsonKey(name: "@id")
  String get id;
  @JsonKey(name: "@type")
  String get type;
  @JsonKey(name: "halls")
  List<Hall> get halls;
  @JsonKey(name: "days")
  List<Day> get days;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleCopyWith<Schedule> get copyWith =>
      _$ScheduleCopyWithImpl<Schedule>(this as Schedule, _$identity);

  /// Serializes this Schedule to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Schedule &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.halls, halls) &&
            const DeepCollectionEquality().equals(other.days, days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      context,
      id,
      type,
      const DeepCollectionEquality().hash(halls),
      const DeepCollectionEquality().hash(days));

  @override
  String toString() {
    return 'Schedule(context: $context, id: $id, type: $type, halls: $halls, days: $days)';
  }
}

/// @nodoc
abstract mixin class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) _then) =
      _$ScheduleCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "@context") String context,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "@type") String type,
      @JsonKey(name: "halls") List<Hall> halls,
      @JsonKey(name: "days") List<Day> days});
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res> implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._self, this._then);

  final Schedule _self;
  final $Res Function(Schedule) _then;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? id = null,
    Object? type = null,
    Object? halls = null,
    Object? days = null,
  }) {
    return _then(_self.copyWith(
      context: null == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      halls: null == halls
          ? _self.halls
          : halls // ignore: cast_nullable_to_non_nullable
              as List<Hall>,
      days: null == days
          ? _self.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<Day>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Schedule implements Schedule {
  const _Schedule(
      {@JsonKey(name: "@context") required this.context,
      @JsonKey(name: "@id") required this.id,
      @JsonKey(name: "@type") required this.type,
      @JsonKey(name: "halls") required final List<Hall> halls,
      @JsonKey(name: "days") required final List<Day> days})
      : _halls = halls,
        _days = days;
  factory _Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

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

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScheduleCopyWith<_Schedule> get copyWith =>
      __$ScheduleCopyWithImpl<_Schedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ScheduleToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Schedule &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._halls, _halls) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      context,
      id,
      type,
      const DeepCollectionEquality().hash(_halls),
      const DeepCollectionEquality().hash(_days));

  @override
  String toString() {
    return 'Schedule(context: $context, id: $id, type: $type, halls: $halls, days: $days)';
  }
}

/// @nodoc
abstract mixin class _$ScheduleCopyWith<$Res>
    implements $ScheduleCopyWith<$Res> {
  factory _$ScheduleCopyWith(_Schedule value, $Res Function(_Schedule) _then) =
      __$ScheduleCopyWithImpl;
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
class __$ScheduleCopyWithImpl<$Res> implements _$ScheduleCopyWith<$Res> {
  __$ScheduleCopyWithImpl(this._self, this._then);

  final _Schedule _self;
  final $Res Function(_Schedule) _then;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? context = null,
    Object? id = null,
    Object? type = null,
    Object? halls = null,
    Object? days = null,
  }) {
    return _then(_Schedule(
      context: null == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      halls: null == halls
          ? _self._halls
          : halls // ignore: cast_nullable_to_non_nullable
              as List<Hall>,
      days: null == days
          ? _self._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<Day>,
    ));
  }
}

/// @nodoc
mixin _$Day {
  @JsonKey(name: "@type")
  String get type;
  @JsonKey(name: "@id")
  String get id;
  @JsonKey(name: "date")
  DateTime get origDate;
  @JsonKey(name: "eventGroups")
  List<EventGroup> get eventGroups;

  /// Create a copy of Day
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DayCopyWith<Day> get copyWith =>
      _$DayCopyWithImpl<Day>(this as Day, _$identity);

  /// Serializes this Day to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Day &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.origDate, origDate) ||
                other.origDate == origDate) &&
            const DeepCollectionEquality()
                .equals(other.eventGroups, eventGroups));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, id, origDate,
      const DeepCollectionEquality().hash(eventGroups));

  @override
  String toString() {
    return 'Day(type: $type, id: $id, origDate: $origDate, eventGroups: $eventGroups)';
  }
}

/// @nodoc
abstract mixin class $DayCopyWith<$Res> {
  factory $DayCopyWith(Day value, $Res Function(Day) _then) = _$DayCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "@type") String type,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "date") DateTime origDate,
      @JsonKey(name: "eventGroups") List<EventGroup> eventGroups});
}

/// @nodoc
class _$DayCopyWithImpl<$Res> implements $DayCopyWith<$Res> {
  _$DayCopyWithImpl(this._self, this._then);

  final Day _self;
  final $Res Function(Day) _then;

  /// Create a copy of Day
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? origDate = null,
    Object? eventGroups = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      origDate: null == origDate
          ? _self.origDate
          : origDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventGroups: null == eventGroups
          ? _self.eventGroups
          : eventGroups // ignore: cast_nullable_to_non_nullable
              as List<EventGroup>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Day extends Day {
  const _Day(
      {@JsonKey(name: "@type") required this.type,
      @JsonKey(name: "@id") required this.id,
      @JsonKey(name: "date") required this.origDate,
      @JsonKey(name: "eventGroups")
      required final List<EventGroup> eventGroups})
      : _eventGroups = eventGroups,
        super._();
  factory _Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  @override
  @JsonKey(name: "@type")
  final String type;
  @override
  @JsonKey(name: "@id")
  final String id;
  @override
  @JsonKey(name: "date")
  final DateTime origDate;
  final List<EventGroup> _eventGroups;
  @override
  @JsonKey(name: "eventGroups")
  List<EventGroup> get eventGroups {
    if (_eventGroups is EqualUnmodifiableListView) return _eventGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eventGroups);
  }

  /// Create a copy of Day
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DayCopyWith<_Day> get copyWith =>
      __$DayCopyWithImpl<_Day>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DayToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Day &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.origDate, origDate) ||
                other.origDate == origDate) &&
            const DeepCollectionEquality()
                .equals(other._eventGroups, _eventGroups));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, id, origDate,
      const DeepCollectionEquality().hash(_eventGroups));

  @override
  String toString() {
    return 'Day(type: $type, id: $id, origDate: $origDate, eventGroups: $eventGroups)';
  }
}

/// @nodoc
abstract mixin class _$DayCopyWith<$Res> implements $DayCopyWith<$Res> {
  factory _$DayCopyWith(_Day value, $Res Function(_Day) _then) =
      __$DayCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "@type") String type,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "date") DateTime origDate,
      @JsonKey(name: "eventGroups") List<EventGroup> eventGroups});
}

/// @nodoc
class __$DayCopyWithImpl<$Res> implements _$DayCopyWith<$Res> {
  __$DayCopyWithImpl(this._self, this._then);

  final _Day _self;
  final $Res Function(_Day) _then;

  /// Create a copy of Day
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? origDate = null,
    Object? eventGroups = null,
  }) {
    return _then(_Day(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      origDate: null == origDate
          ? _self.origDate
          : origDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventGroups: null == eventGroups
          ? _self._eventGroups
          : eventGroups // ignore: cast_nullable_to_non_nullable
              as List<EventGroup>,
    ));
  }
}

/// @nodoc
mixin _$EventGroup {
  @JsonKey(name: "@type")
  String get type;
  @JsonKey(name: "@id")
  String get id;
  @JsonKey(name: "columns")
  List<Hall> get columns;

  /// Create a copy of EventGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EventGroupCopyWith<EventGroup> get copyWith =>
      _$EventGroupCopyWithImpl<EventGroup>(this as EventGroup, _$identity);

  /// Serializes this EventGroup to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventGroup &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.columns, columns));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, id, const DeepCollectionEquality().hash(columns));

  @override
  String toString() {
    return 'EventGroup(type: $type, id: $id, columns: $columns)';
  }
}

/// @nodoc
abstract mixin class $EventGroupCopyWith<$Res> {
  factory $EventGroupCopyWith(
          EventGroup value, $Res Function(EventGroup) _then) =
      _$EventGroupCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "@type") String type,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "columns") List<Hall> columns});
}

/// @nodoc
class _$EventGroupCopyWithImpl<$Res> implements $EventGroupCopyWith<$Res> {
  _$EventGroupCopyWithImpl(this._self, this._then);

  final EventGroup _self;
  final $Res Function(EventGroup) _then;

  /// Create a copy of EventGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? columns = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      columns: null == columns
          ? _self.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as List<Hall>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _EventGroup implements EventGroup {
  const _EventGroup(
      {@JsonKey(name: "@type") required this.type,
      @JsonKey(name: "@id") required this.id,
      @JsonKey(name: "columns") required final List<Hall> columns})
      : _columns = columns;
  factory _EventGroup.fromJson(Map<String, dynamic> json) =>
      _$EventGroupFromJson(json);

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

  /// Create a copy of EventGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EventGroupCopyWith<_EventGroup> get copyWith =>
      __$EventGroupCopyWithImpl<_EventGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EventGroupToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventGroup &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._columns, _columns));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, id, const DeepCollectionEquality().hash(_columns));

  @override
  String toString() {
    return 'EventGroup(type: $type, id: $id, columns: $columns)';
  }
}

/// @nodoc
abstract mixin class _$EventGroupCopyWith<$Res>
    implements $EventGroupCopyWith<$Res> {
  factory _$EventGroupCopyWith(
          _EventGroup value, $Res Function(_EventGroup) _then) =
      __$EventGroupCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "@type") String type,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "columns") List<Hall> columns});
}

/// @nodoc
class __$EventGroupCopyWithImpl<$Res> implements _$EventGroupCopyWith<$Res> {
  __$EventGroupCopyWithImpl(this._self, this._then);

  final _EventGroup _self;
  final $Res Function(_EventGroup) _then;

  /// Create a copy of EventGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? columns = null,
  }) {
    return _then(_EventGroup(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      columns: null == columns
          ? _self._columns
          : columns // ignore: cast_nullable_to_non_nullable
              as List<Hall>,
    ));
  }
}

/// @nodoc
mixin _$Hall {
  @JsonKey(name: "@type")
  String get type;
  @JsonKey(name: "@id")
  String get id;
  @JsonKey(name: "events")
  List<ScheduleEvent>? get events;
  @JsonKey(name: "name")
  String? get name;
  @JsonKey(name: "color")
  String? get color;
  @JsonKey(name: "accomodation")
  Hall? get accomodation;

  /// Create a copy of Hall
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HallCopyWith<Hall> get copyWith =>
      _$HallCopyWithImpl<Hall>(this as Hall, _$identity);

  /// Serializes this Hall to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Hall &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.events, events) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.accomodation, accomodation) ||
                other.accomodation == accomodation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, id,
      const DeepCollectionEquality().hash(events), name, color, accomodation);

  @override
  String toString() {
    return 'Hall(type: $type, id: $id, events: $events, name: $name, color: $color, accomodation: $accomodation)';
  }
}

/// @nodoc
abstract mixin class $HallCopyWith<$Res> {
  factory $HallCopyWith(Hall value, $Res Function(Hall) _then) =
      _$HallCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "@type") String type,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "events") List<ScheduleEvent>? events,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "color") String? color,
      @JsonKey(name: "accomodation") Hall? accomodation});

  $HallCopyWith<$Res>? get accomodation;
}

/// @nodoc
class _$HallCopyWithImpl<$Res> implements $HallCopyWith<$Res> {
  _$HallCopyWithImpl(this._self, this._then);

  final Hall _self;
  final $Res Function(Hall) _then;

  /// Create a copy of Hall
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? events = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? accomodation = freezed,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      events: freezed == events
          ? _self.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<ScheduleEvent>?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      accomodation: freezed == accomodation
          ? _self.accomodation
          : accomodation // ignore: cast_nullable_to_non_nullable
              as Hall?,
    ));
  }

  /// Create a copy of Hall
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HallCopyWith<$Res>? get accomodation {
    if (_self.accomodation == null) {
      return null;
    }

    return $HallCopyWith<$Res>(_self.accomodation!, (value) {
      return _then(_self.copyWith(accomodation: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Hall implements Hall {
  const _Hall(
      {@JsonKey(name: "@type") required this.type,
      @JsonKey(name: "@id") required this.id,
      @JsonKey(name: "events") final List<ScheduleEvent>? events,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "color") this.color,
      @JsonKey(name: "accomodation") this.accomodation})
      : _events = events;
  factory _Hall.fromJson(Map<String, dynamic> json) => _$HallFromJson(json);

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
  @JsonKey(name: "color")
  final String? color;
  @override
  @JsonKey(name: "accomodation")
  final Hall? accomodation;

  /// Create a copy of Hall
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HallCopyWith<_Hall> get copyWith =>
      __$HallCopyWithImpl<_Hall>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HallToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Hall &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.accomodation, accomodation) ||
                other.accomodation == accomodation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, id,
      const DeepCollectionEquality().hash(_events), name, color, accomodation);

  @override
  String toString() {
    return 'Hall(type: $type, id: $id, events: $events, name: $name, color: $color, accomodation: $accomodation)';
  }
}

/// @nodoc
abstract mixin class _$HallCopyWith<$Res> implements $HallCopyWith<$Res> {
  factory _$HallCopyWith(_Hall value, $Res Function(_Hall) _then) =
      __$HallCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "@type") String type,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "events") List<ScheduleEvent>? events,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "color") String? color,
      @JsonKey(name: "accomodation") Hall? accomodation});

  @override
  $HallCopyWith<$Res>? get accomodation;
}

/// @nodoc
class __$HallCopyWithImpl<$Res> implements _$HallCopyWith<$Res> {
  __$HallCopyWithImpl(this._self, this._then);

  final _Hall _self;
  final $Res Function(_Hall) _then;

  /// Create a copy of Hall
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? events = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? accomodation = freezed,
  }) {
    return _then(_Hall(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      events: freezed == events
          ? _self._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<ScheduleEvent>?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      accomodation: freezed == accomodation
          ? _self.accomodation
          : accomodation // ignore: cast_nullable_to_non_nullable
              as Hall?,
    ));
  }

  /// Create a copy of Hall
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HallCopyWith<$Res>? get accomodation {
    if (_self.accomodation == null) {
      return null;
    }

    return $HallCopyWith<$Res>(_self.accomodation!, (value) {
      return _then(_self.copyWith(accomodation: value));
    });
  }
}

/// @nodoc
mixin _$ScheduleEvent {
  @JsonKey(name: "@type")
  String get type;
  @JsonKey(name: "@id")
  String get id;
  @JsonKey(name: "id")
  int get eventId;
  @JsonKey(name: "class")
  String get eventClass;
  @JsonKey(name: "title")
  String get title;
  @JsonKey(name: "start")
  DateTime get originalStart;
  @JsonKey(name: "end")
  DateTime get originalEnd;
  @JsonKey(name: "children", defaultValue: [])
  List<ScheduleEvent> get children;
  @JsonKey(name: "favourite")
  int? get favourite;
  @JsonKey(name: "isTimeHidden")
  bool get isTimeHidden;
  @JsonKey(name: "isRatable")
  bool get isRatable;
  @JsonKey(name: "structuredAuthors")
  StructuredAuthors? get structuredAuthors;
  @JsonKey(name: "body")
  String? get body;
  @JsonKey(name: "subtitle")
  String? get subtitle;
  @JsonKey(name: "chairs")
  String? get chairs;
  @JsonKey(name: "authors")
  List<Author>? get authors;
  @JsonKey(name: "media")
  String? get media;
  @JsonKey(name: "rate")
  double? get rate;

  /// Create a copy of ScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleEventCopyWith<ScheduleEvent> get copyWith =>
      _$ScheduleEventCopyWithImpl<ScheduleEvent>(
          this as ScheduleEvent, _$identity);

  /// Serializes this ScheduleEvent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleEvent &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.eventClass, eventClass) ||
                other.eventClass == eventClass) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.originalStart, originalStart) ||
                other.originalStart == originalStart) &&
            (identical(other.originalEnd, originalEnd) ||
                other.originalEnd == originalEnd) &&
            const DeepCollectionEquality().equals(other.children, children) &&
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
            const DeepCollectionEquality().equals(other.authors, authors) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      id,
      eventId,
      eventClass,
      title,
      originalStart,
      originalEnd,
      const DeepCollectionEquality().hash(children),
      favourite,
      isTimeHidden,
      isRatable,
      structuredAuthors,
      body,
      subtitle,
      chairs,
      const DeepCollectionEquality().hash(authors),
      media,
      rate);

  @override
  String toString() {
    return 'ScheduleEvent(type: $type, id: $id, eventId: $eventId, eventClass: $eventClass, title: $title, originalStart: $originalStart, originalEnd: $originalEnd, children: $children, favourite: $favourite, isTimeHidden: $isTimeHidden, isRatable: $isRatable, structuredAuthors: $structuredAuthors, body: $body, subtitle: $subtitle, chairs: $chairs, authors: $authors, media: $media, rate: $rate)';
  }
}

/// @nodoc
abstract mixin class $ScheduleEventCopyWith<$Res> {
  factory $ScheduleEventCopyWith(
          ScheduleEvent value, $Res Function(ScheduleEvent) _then) =
      _$ScheduleEventCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "@type") String type,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "id") int eventId,
      @JsonKey(name: "class") String eventClass,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "start") DateTime originalStart,
      @JsonKey(name: "end") DateTime originalEnd,
      @JsonKey(name: "children", defaultValue: []) List<ScheduleEvent> children,
      @JsonKey(name: "favourite") int? favourite,
      @JsonKey(name: "isTimeHidden") bool isTimeHidden,
      @JsonKey(name: "isRatable") bool isRatable,
      @JsonKey(name: "structuredAuthors") StructuredAuthors? structuredAuthors,
      @JsonKey(name: "body") String? body,
      @JsonKey(name: "subtitle") String? subtitle,
      @JsonKey(name: "chairs") String? chairs,
      @JsonKey(name: "authors") List<Author>? authors,
      @JsonKey(name: "media") String? media,
      @JsonKey(name: "rate") double? rate});

  $StructuredAuthorsCopyWith<$Res>? get structuredAuthors;
}

/// @nodoc
class _$ScheduleEventCopyWithImpl<$Res>
    implements $ScheduleEventCopyWith<$Res> {
  _$ScheduleEventCopyWithImpl(this._self, this._then);

  final ScheduleEvent _self;
  final $Res Function(ScheduleEvent) _then;

  /// Create a copy of ScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? eventId = null,
    Object? eventClass = null,
    Object? title = null,
    Object? originalStart = null,
    Object? originalEnd = null,
    Object? children = null,
    Object? favourite = freezed,
    Object? isTimeHidden = null,
    Object? isRatable = null,
    Object? structuredAuthors = freezed,
    Object? body = freezed,
    Object? subtitle = freezed,
    Object? chairs = freezed,
    Object? authors = freezed,
    Object? media = freezed,
    Object? rate = freezed,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      eventClass: null == eventClass
          ? _self.eventClass
          : eventClass // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      originalStart: null == originalStart
          ? _self.originalStart
          : originalStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      originalEnd: null == originalEnd
          ? _self.originalEnd
          : originalEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      children: null == children
          ? _self.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ScheduleEvent>,
      favourite: freezed == favourite
          ? _self.favourite
          : favourite // ignore: cast_nullable_to_non_nullable
              as int?,
      isTimeHidden: null == isTimeHidden
          ? _self.isTimeHidden
          : isTimeHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isRatable: null == isRatable
          ? _self.isRatable
          : isRatable // ignore: cast_nullable_to_non_nullable
              as bool,
      structuredAuthors: freezed == structuredAuthors
          ? _self.structuredAuthors
          : structuredAuthors // ignore: cast_nullable_to_non_nullable
              as StructuredAuthors?,
      body: freezed == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      chairs: freezed == chairs
          ? _self.chairs
          : chairs // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _self.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Author>?,
      media: freezed == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: freezed == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  /// Create a copy of ScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StructuredAuthorsCopyWith<$Res>? get structuredAuthors {
    if (_self.structuredAuthors == null) {
      return null;
    }

    return $StructuredAuthorsCopyWith<$Res>(_self.structuredAuthors!, (value) {
      return _then(_self.copyWith(structuredAuthors: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ScheduleEvent extends ScheduleEvent {
  const _ScheduleEvent(
      {@JsonKey(name: "@type") required this.type,
      @JsonKey(name: "@id") required this.id,
      @JsonKey(name: "id") required this.eventId,
      @JsonKey(name: "class") required this.eventClass,
      @JsonKey(name: "title") required this.title,
      @JsonKey(name: "start") required this.originalStart,
      @JsonKey(name: "end") required this.originalEnd,
      @JsonKey(name: "children", defaultValue: [])
      required final List<ScheduleEvent> children,
      @JsonKey(name: "favourite") this.favourite,
      @JsonKey(name: "isTimeHidden") required this.isTimeHidden,
      @JsonKey(name: "isRatable") required this.isRatable,
      @JsonKey(name: "structuredAuthors") this.structuredAuthors,
      @JsonKey(name: "body") this.body,
      @JsonKey(name: "subtitle") this.subtitle,
      @JsonKey(name: "chairs") this.chairs,
      @JsonKey(name: "authors") final List<Author>? authors,
      @JsonKey(name: "media") this.media,
      @JsonKey(name: "rate") required this.rate})
      : _children = children,
        _authors = authors,
        super._();
  factory _ScheduleEvent.fromJson(Map<String, dynamic> json) =>
      _$ScheduleEventFromJson(json);

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
  final DateTime originalStart;
  @override
  @JsonKey(name: "end")
  final DateTime originalEnd;
  final List<ScheduleEvent> _children;
  @override
  @JsonKey(name: "children", defaultValue: [])
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
  @JsonKey(name: "media")
  final String? media;
  @override
  @JsonKey(name: "rate")
  final double? rate;

  /// Create a copy of ScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScheduleEventCopyWith<_ScheduleEvent> get copyWith =>
      __$ScheduleEventCopyWithImpl<_ScheduleEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ScheduleEventToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleEvent &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.eventClass, eventClass) ||
                other.eventClass == eventClass) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.originalStart, originalStart) ||
                other.originalStart == originalStart) &&
            (identical(other.originalEnd, originalEnd) ||
                other.originalEnd == originalEnd) &&
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
            (identical(other.media, media) || other.media == media) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      id,
      eventId,
      eventClass,
      title,
      originalStart,
      originalEnd,
      const DeepCollectionEquality().hash(_children),
      favourite,
      isTimeHidden,
      isRatable,
      structuredAuthors,
      body,
      subtitle,
      chairs,
      const DeepCollectionEquality().hash(_authors),
      media,
      rate);

  @override
  String toString() {
    return 'ScheduleEvent(type: $type, id: $id, eventId: $eventId, eventClass: $eventClass, title: $title, originalStart: $originalStart, originalEnd: $originalEnd, children: $children, favourite: $favourite, isTimeHidden: $isTimeHidden, isRatable: $isRatable, structuredAuthors: $structuredAuthors, body: $body, subtitle: $subtitle, chairs: $chairs, authors: $authors, media: $media, rate: $rate)';
  }
}

/// @nodoc
abstract mixin class _$ScheduleEventCopyWith<$Res>
    implements $ScheduleEventCopyWith<$Res> {
  factory _$ScheduleEventCopyWith(
          _ScheduleEvent value, $Res Function(_ScheduleEvent) _then) =
      __$ScheduleEventCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "@type") String type,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "id") int eventId,
      @JsonKey(name: "class") String eventClass,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "start") DateTime originalStart,
      @JsonKey(name: "end") DateTime originalEnd,
      @JsonKey(name: "children", defaultValue: []) List<ScheduleEvent> children,
      @JsonKey(name: "favourite") int? favourite,
      @JsonKey(name: "isTimeHidden") bool isTimeHidden,
      @JsonKey(name: "isRatable") bool isRatable,
      @JsonKey(name: "structuredAuthors") StructuredAuthors? structuredAuthors,
      @JsonKey(name: "body") String? body,
      @JsonKey(name: "subtitle") String? subtitle,
      @JsonKey(name: "chairs") String? chairs,
      @JsonKey(name: "authors") List<Author>? authors,
      @JsonKey(name: "media") String? media,
      @JsonKey(name: "rate") double? rate});

  @override
  $StructuredAuthorsCopyWith<$Res>? get structuredAuthors;
}

/// @nodoc
class __$ScheduleEventCopyWithImpl<$Res>
    implements _$ScheduleEventCopyWith<$Res> {
  __$ScheduleEventCopyWithImpl(this._self, this._then);

  final _ScheduleEvent _self;
  final $Res Function(_ScheduleEvent) _then;

  /// Create a copy of ScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? eventId = null,
    Object? eventClass = null,
    Object? title = null,
    Object? originalStart = null,
    Object? originalEnd = null,
    Object? children = null,
    Object? favourite = freezed,
    Object? isTimeHidden = null,
    Object? isRatable = null,
    Object? structuredAuthors = freezed,
    Object? body = freezed,
    Object? subtitle = freezed,
    Object? chairs = freezed,
    Object? authors = freezed,
    Object? media = freezed,
    Object? rate = freezed,
  }) {
    return _then(_ScheduleEvent(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      eventClass: null == eventClass
          ? _self.eventClass
          : eventClass // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      originalStart: null == originalStart
          ? _self.originalStart
          : originalStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      originalEnd: null == originalEnd
          ? _self.originalEnd
          : originalEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      children: null == children
          ? _self._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ScheduleEvent>,
      favourite: freezed == favourite
          ? _self.favourite
          : favourite // ignore: cast_nullable_to_non_nullable
              as int?,
      isTimeHidden: null == isTimeHidden
          ? _self.isTimeHidden
          : isTimeHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isRatable: null == isRatable
          ? _self.isRatable
          : isRatable // ignore: cast_nullable_to_non_nullable
              as bool,
      structuredAuthors: freezed == structuredAuthors
          ? _self.structuredAuthors
          : structuredAuthors // ignore: cast_nullable_to_non_nullable
              as StructuredAuthors?,
      body: freezed == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      chairs: freezed == chairs
          ? _self.chairs
          : chairs // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _self._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Author>?,
      media: freezed == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: freezed == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  /// Create a copy of ScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StructuredAuthorsCopyWith<$Res>? get structuredAuthors {
    if (_self.structuredAuthors == null) {
      return null;
    }

    return $StructuredAuthorsCopyWith<$Res>(_self.structuredAuthors!, (value) {
      return _then(_self.copyWith(structuredAuthors: value));
    });
  }
}

/// @nodoc
mixin _$StructuredAuthors {
  @JsonKey(name: "@type")
  String get type;
  @JsonKey(name: "@id")
  String get id;
  @JsonKey(name: "institutions")
  List<Institution> get institutions;
  @JsonKey(name: "names")
  List<Name> get names;
  @JsonKey(name: "hasMoreAuthors")
  bool get hasMoreAuthors;

  /// Create a copy of StructuredAuthors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StructuredAuthorsCopyWith<StructuredAuthors> get copyWith =>
      _$StructuredAuthorsCopyWithImpl<StructuredAuthors>(
          this as StructuredAuthors, _$identity);

  /// Serializes this StructuredAuthors to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StructuredAuthors &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.institutions, institutions) &&
            const DeepCollectionEquality().equals(other.names, names) &&
            (identical(other.hasMoreAuthors, hasMoreAuthors) ||
                other.hasMoreAuthors == hasMoreAuthors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      id,
      const DeepCollectionEquality().hash(institutions),
      const DeepCollectionEquality().hash(names),
      hasMoreAuthors);

  @override
  String toString() {
    return 'StructuredAuthors(type: $type, id: $id, institutions: $institutions, names: $names, hasMoreAuthors: $hasMoreAuthors)';
  }
}

/// @nodoc
abstract mixin class $StructuredAuthorsCopyWith<$Res> {
  factory $StructuredAuthorsCopyWith(
          StructuredAuthors value, $Res Function(StructuredAuthors) _then) =
      _$StructuredAuthorsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "@type") String type,
      @JsonKey(name: "@id") String id,
      @JsonKey(name: "institutions") List<Institution> institutions,
      @JsonKey(name: "names") List<Name> names,
      @JsonKey(name: "hasMoreAuthors") bool hasMoreAuthors});
}

/// @nodoc
class _$StructuredAuthorsCopyWithImpl<$Res>
    implements $StructuredAuthorsCopyWith<$Res> {
  _$StructuredAuthorsCopyWithImpl(this._self, this._then);

  final StructuredAuthors _self;
  final $Res Function(StructuredAuthors) _then;

  /// Create a copy of StructuredAuthors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? institutions = null,
    Object? names = null,
    Object? hasMoreAuthors = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      institutions: null == institutions
          ? _self.institutions
          : institutions // ignore: cast_nullable_to_non_nullable
              as List<Institution>,
      names: null == names
          ? _self.names
          : names // ignore: cast_nullable_to_non_nullable
              as List<Name>,
      hasMoreAuthors: null == hasMoreAuthors
          ? _self.hasMoreAuthors
          : hasMoreAuthors // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _StructuredAuthors implements StructuredAuthors {
  const _StructuredAuthors(
      {@JsonKey(name: "@type") required this.type,
      @JsonKey(name: "@id") required this.id,
      @JsonKey(name: "institutions")
      required final List<Institution> institutions,
      @JsonKey(name: "names") required final List<Name> names,
      @JsonKey(name: "hasMoreAuthors") required this.hasMoreAuthors})
      : _institutions = institutions,
        _names = names;
  factory _StructuredAuthors.fromJson(Map<String, dynamic> json) =>
      _$StructuredAuthorsFromJson(json);

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

  /// Create a copy of StructuredAuthors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StructuredAuthorsCopyWith<_StructuredAuthors> get copyWith =>
      __$StructuredAuthorsCopyWithImpl<_StructuredAuthors>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StructuredAuthorsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StructuredAuthors &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._institutions, _institutions) &&
            const DeepCollectionEquality().equals(other._names, _names) &&
            (identical(other.hasMoreAuthors, hasMoreAuthors) ||
                other.hasMoreAuthors == hasMoreAuthors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      id,
      const DeepCollectionEquality().hash(_institutions),
      const DeepCollectionEquality().hash(_names),
      hasMoreAuthors);

  @override
  String toString() {
    return 'StructuredAuthors(type: $type, id: $id, institutions: $institutions, names: $names, hasMoreAuthors: $hasMoreAuthors)';
  }
}

/// @nodoc
abstract mixin class _$StructuredAuthorsCopyWith<$Res>
    implements $StructuredAuthorsCopyWith<$Res> {
  factory _$StructuredAuthorsCopyWith(
          _StructuredAuthors value, $Res Function(_StructuredAuthors) _then) =
      __$StructuredAuthorsCopyWithImpl;
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
class __$StructuredAuthorsCopyWithImpl<$Res>
    implements _$StructuredAuthorsCopyWith<$Res> {
  __$StructuredAuthorsCopyWithImpl(this._self, this._then);

  final _StructuredAuthors _self;
  final $Res Function(_StructuredAuthors) _then;

  /// Create a copy of StructuredAuthors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? institutions = null,
    Object? names = null,
    Object? hasMoreAuthors = null,
  }) {
    return _then(_StructuredAuthors(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      institutions: null == institutions
          ? _self._institutions
          : institutions // ignore: cast_nullable_to_non_nullable
              as List<Institution>,
      names: null == names
          ? _self._names
          : names // ignore: cast_nullable_to_non_nullable
              as List<Name>,
      hasMoreAuthors: null == hasMoreAuthors
          ? _self.hasMoreAuthors
          : hasMoreAuthors // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$Institution {
  @JsonKey(name: "name")
  String? get name;
  @JsonKey(name: "institution_id")
  int? get institutionId;
  @JsonKey(name: "need_fix")
  int? get needFix;

  /// Create a copy of Institution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InstitutionCopyWith<Institution> get copyWith =>
      _$InstitutionCopyWithImpl<Institution>(this as Institution, _$identity);

  /// Serializes this Institution to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Institution &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.institutionId, institutionId) ||
                other.institutionId == institutionId) &&
            (identical(other.needFix, needFix) || other.needFix == needFix));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, institutionId, needFix);

  @override
  String toString() {
    return 'Institution(name: $name, institutionId: $institutionId, needFix: $needFix)';
  }
}

/// @nodoc
abstract mixin class $InstitutionCopyWith<$Res> {
  factory $InstitutionCopyWith(
          Institution value, $Res Function(Institution) _then) =
      _$InstitutionCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "institution_id") int? institutionId,
      @JsonKey(name: "need_fix") int? needFix});
}

/// @nodoc
class _$InstitutionCopyWithImpl<$Res> implements $InstitutionCopyWith<$Res> {
  _$InstitutionCopyWithImpl(this._self, this._then);

  final Institution _self;
  final $Res Function(Institution) _then;

  /// Create a copy of Institution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? institutionId = freezed,
    Object? needFix = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      institutionId: freezed == institutionId
          ? _self.institutionId
          : institutionId // ignore: cast_nullable_to_non_nullable
              as int?,
      needFix: freezed == needFix
          ? _self.needFix
          : needFix // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Institution implements Institution {
  const _Institution(
      {@JsonKey(name: "name") required this.name,
      @JsonKey(name: "institution_id") required this.institutionId,
      @JsonKey(name: "need_fix") required this.needFix});
  factory _Institution.fromJson(Map<String, dynamic> json) =>
      _$InstitutionFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "institution_id")
  final int? institutionId;
  @override
  @JsonKey(name: "need_fix")
  final int? needFix;

  /// Create a copy of Institution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InstitutionCopyWith<_Institution> get copyWith =>
      __$InstitutionCopyWithImpl<_Institution>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InstitutionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Institution &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.institutionId, institutionId) ||
                other.institutionId == institutionId) &&
            (identical(other.needFix, needFix) || other.needFix == needFix));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, institutionId, needFix);

  @override
  String toString() {
    return 'Institution(name: $name, institutionId: $institutionId, needFix: $needFix)';
  }
}

/// @nodoc
abstract mixin class _$InstitutionCopyWith<$Res>
    implements $InstitutionCopyWith<$Res> {
  factory _$InstitutionCopyWith(
          _Institution value, $Res Function(_Institution) _then) =
      __$InstitutionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "institution_id") int? institutionId,
      @JsonKey(name: "need_fix") int? needFix});
}

/// @nodoc
class __$InstitutionCopyWithImpl<$Res> implements _$InstitutionCopyWith<$Res> {
  __$InstitutionCopyWithImpl(this._self, this._then);

  final _Institution _self;
  final $Res Function(_Institution) _then;

  /// Create a copy of Institution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? institutionId = freezed,
    Object? needFix = freezed,
  }) {
    return _then(_Institution(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      institutionId: freezed == institutionId
          ? _self.institutionId
          : institutionId // ignore: cast_nullable_to_non_nullable
              as int?,
      needFix: freezed == needFix
          ? _self.needFix
          : needFix // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$Name {
  @JsonKey(name: "orig")
  List<dynamic> get orig;
  @JsonKey(name: "name")
  String get name;
  @JsonKey(name: "isPresenter")
  bool get isPresenter;
  @JsonKey(name: "profession")
  dynamic get profession;
  @JsonKey(name: "indexes")
  List<int> get indexes;
  @JsonKey(name: "image")
  dynamic get image;

  /// Create a copy of Name
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NameCopyWith<Name> get copyWith =>
      _$NameCopyWithImpl<Name>(this as Name, _$identity);

  /// Serializes this Name to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Name &&
            const DeepCollectionEquality().equals(other.orig, orig) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isPresenter, isPresenter) ||
                other.isPresenter == isPresenter) &&
            const DeepCollectionEquality()
                .equals(other.profession, profession) &&
            const DeepCollectionEquality().equals(other.indexes, indexes) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(orig),
      name,
      isPresenter,
      const DeepCollectionEquality().hash(profession),
      const DeepCollectionEquality().hash(indexes),
      const DeepCollectionEquality().hash(image));

  @override
  String toString() {
    return 'Name(orig: $orig, name: $name, isPresenter: $isPresenter, profession: $profession, indexes: $indexes, image: $image)';
  }
}

/// @nodoc
abstract mixin class $NameCopyWith<$Res> {
  factory $NameCopyWith(Name value, $Res Function(Name) _then) =
      _$NameCopyWithImpl;
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
class _$NameCopyWithImpl<$Res> implements $NameCopyWith<$Res> {
  _$NameCopyWithImpl(this._self, this._then);

  final Name _self;
  final $Res Function(Name) _then;

  /// Create a copy of Name
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      orig: null == orig
          ? _self.orig
          : orig // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isPresenter: null == isPresenter
          ? _self.isPresenter
          : isPresenter // ignore: cast_nullable_to_non_nullable
              as bool,
      profession: freezed == profession
          ? _self.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as dynamic,
      indexes: null == indexes
          ? _self.indexes
          : indexes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Name implements Name {
  const _Name(
      {@JsonKey(name: "orig") required final List<dynamic> orig,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "isPresenter") required this.isPresenter,
      @JsonKey(name: "profession") required this.profession,
      @JsonKey(name: "indexes") required final List<int> indexes,
      @JsonKey(name: "image") required this.image})
      : _orig = orig,
        _indexes = indexes;
  factory _Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

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

  /// Create a copy of Name
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NameCopyWith<_Name> get copyWith =>
      __$NameCopyWithImpl<_Name>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NameToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Name &&
            const DeepCollectionEquality().equals(other._orig, _orig) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isPresenter, isPresenter) ||
                other.isPresenter == isPresenter) &&
            const DeepCollectionEquality()
                .equals(other.profession, profession) &&
            const DeepCollectionEquality().equals(other._indexes, _indexes) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_orig),
      name,
      isPresenter,
      const DeepCollectionEquality().hash(profession),
      const DeepCollectionEquality().hash(_indexes),
      const DeepCollectionEquality().hash(image));

  @override
  String toString() {
    return 'Name(orig: $orig, name: $name, isPresenter: $isPresenter, profession: $profession, indexes: $indexes, image: $image)';
  }
}

/// @nodoc
abstract mixin class _$NameCopyWith<$Res> implements $NameCopyWith<$Res> {
  factory _$NameCopyWith(_Name value, $Res Function(_Name) _then) =
      __$NameCopyWithImpl;
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
class __$NameCopyWithImpl<$Res> implements _$NameCopyWith<$Res> {
  __$NameCopyWithImpl(this._self, this._then);

  final _Name _self;
  final $Res Function(_Name) _then;

  /// Create a copy of Name
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? orig = null,
    Object? name = null,
    Object? isPresenter = null,
    Object? profession = freezed,
    Object? indexes = null,
    Object? image = freezed,
  }) {
    return _then(_Name(
      orig: null == orig
          ? _self._orig
          : orig // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isPresenter: null == isPresenter
          ? _self.isPresenter
          : isPresenter // ignore: cast_nullable_to_non_nullable
              as bool,
      profession: freezed == profession
          ? _self.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as dynamic,
      indexes: null == indexes
          ? _self._indexes
          : indexes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

// dart format on
