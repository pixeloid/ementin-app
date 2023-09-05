// This file is "main.dart"
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
}

@freezed
class Day with _$Day {
  const factory Day({
    @JsonKey(name: "@type") required String type,
    @JsonKey(name: "@id") required String id,
    @JsonKey(name: "date") required DateTime date,
    @JsonKey(name: "eventGroups") required List<EventGroup> eventGroups,
  }) = _Day;
}

@freezed
class EventGroup with _$EventGroup {
  const factory EventGroup({
    @JsonKey(name: "@type") required String type,
    @JsonKey(name: "@id") required String id,
    @JsonKey(name: "columns") required List<Hall> columns,
  }) = _EventGroup;
}

@freezed
class Hall with _$Hall {
  const factory Hall({
    @JsonKey(name: "@type") required String type,
    @JsonKey(name: "@id") required String id,
    @JsonKey(name: "events") List<Event>? events,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "accomodation") Hall? accomodation,
  }) = _Hall;
}

@freezed
class Event with _$Event {
  const factory Event({
    @JsonKey(name: "@type") required String type,
    @JsonKey(name: "@id") required String id,
    @JsonKey(name: "id") required int eventId,
    @JsonKey(name: "class") required String eventClass,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "start") required DateTime start,
    @JsonKey(name: "end") required DateTime end,
    @JsonKey(name: "children") required List<Event> children,
    @JsonKey(name: "favourite") bool? favourite,
    @JsonKey(name: "isTimeHidden") required bool isTimeHidden,
    @JsonKey(name: "structuredAuthors") StructuredAuthors? structuredAuthors,
    @JsonKey(name: "body") String? body,
    @JsonKey(name: "subtitle") String? subtitle,
  }) = _Event;
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
}

@freezed
class Institution with _$Institution {
  const factory Institution({
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "institution_id") required int? institutionId,
    @JsonKey(name: "need_fix") required int? needFix,
  }) = _Institution;
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
}
