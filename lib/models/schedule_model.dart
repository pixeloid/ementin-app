// This file is "main.dart"
// ignore_for_file: invalid_annotation_target

import 'package:eventapp/models/author/author.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_model.freezed.dart';
part 'schedule_model.g.dart';

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    @JsonKey(name: "@context") required String context,
    @JsonKey(name: "@id") required String id,
    @JsonKey(name: "@type") required String type,
    @JsonKey(name: "halls") required List<Hall> halls,
    @JsonKey(name: "days") required List<Day> days,
  }) = _Schedule;
  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}

@freezed
class Day with _$Day {
  const factory Day({
    @JsonKey(name: "@type") required String type,
    @JsonKey(name: "@id") required String id,
    @JsonKey(name: "date") required DateTime date,
    @JsonKey(name: "eventGroups") required List<EventGroup> eventGroups,
  }) = _Day;
  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}

@freezed
class EventGroup with _$EventGroup {
  const factory EventGroup({
    @JsonKey(name: "@type") required String type,
    @JsonKey(name: "@id") required String id,
    @JsonKey(name: "columns") required List<Hall> columns,
  }) = _EventGroup;
  factory EventGroup.fromJson(Map<String, dynamic> json) =>
      _$EventGroupFromJson(json);
}

@freezed
class Hall with _$Hall {
  const factory Hall({
    @JsonKey(name: "@type") required String type,
    @JsonKey(name: "@id") required String id,
    @JsonKey(name: "events") List<ScheduleEvent>? events,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "accomodation") Hall? accomodation,
  }) = _Hall;
  factory Hall.fromJson(Map<String, dynamic> json) => _$HallFromJson(json);
}

@freezed
class ScheduleEvent with _$ScheduleEvent {
  const ScheduleEvent._();

  const factory ScheduleEvent({
    @JsonKey(name: "@type") required String type,
    @JsonKey(name: "@id") required String id,
    @JsonKey(name: "id") required int eventId,
    @JsonKey(name: "class") required String eventClass,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "start") required DateTime start,
    @JsonKey(name: "end") required DateTime end,
    @JsonKey(name: "children") required List<ScheduleEvent> children,
    @JsonKey(name: "favourite") int? favourite,
    @JsonKey(name: "isTimeHidden") required bool isTimeHidden,
    @JsonKey(name: "isRatable") required bool isRatable,
    @JsonKey(name: "structuredAuthors") StructuredAuthors? structuredAuthors,
    @JsonKey(name: "body") String? body,
    @JsonKey(name: "subtitle") String? subtitle,
    @JsonKey(name: "chairs") String? chairs,
    @JsonKey(name: "authors") List<Author>? authors,
    @JsonKey(name: "rate") required double? rate,
  }) = _Event;
  factory ScheduleEvent.fromJson(Map<String, dynamic> json) =>
      _$ScheduleEventFromJson(json);
  get duration => end.difference(start);
}

@freezed
class StructuredAuthors with _$StructuredAuthors {
  const factory StructuredAuthors({
    @JsonKey(name: "@type") required String type,
    @JsonKey(name: "@id") required String id,
    @JsonKey(name: "institutions") required List<Institution> institutions,
    @JsonKey(name: "names") required List<Name> names,
    @JsonKey(name: "hasMoreAuthors") required bool hasMoreAuthors,
  }) = _StructuredAuthors;
  factory StructuredAuthors.fromJson(Map<String, dynamic> json) =>
      _$StructuredAuthorsFromJson(json);
}

@freezed
class Institution with _$Institution {
  const factory Institution({
    @JsonKey(name: "name") required String? name,
    @JsonKey(name: "institution_id") required int? institutionId,
    @JsonKey(name: "need_fix") required int? needFix,
  }) = _Institution;
  factory Institution.fromJson(Map<String, dynamic> json) =>
      _$InstitutionFromJson(json);
}

@freezed
class Name with _$Name {
  const factory Name({
    @JsonKey(name: "orig") required List<dynamic> orig,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "isPresenter") required bool isPresenter,
    @JsonKey(name: "profession") required dynamic profession,
    @JsonKey(name: "indexes") required List<int> indexes,
    @JsonKey(name: "image") required dynamic image,
  }) = _Name;
  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}
