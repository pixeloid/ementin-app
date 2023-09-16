// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Schedule _$$_ScheduleFromJson(Map<String, dynamic> json) => _$_Schedule(
      context: json['@context'] as String,
      id: json['@id'] as String,
      type: json['@type'] as String,
      halls: (json['halls'] as List<dynamic>)
          .map((e) => Hall.fromJson(e as Map<String, dynamic>))
          .toList(),
      days: (json['days'] as List<dynamic>)
          .map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ScheduleToJson(_$_Schedule instance) =>
    <String, dynamic>{
      '@context': instance.context,
      '@id': instance.id,
      '@type': instance.type,
      'halls': instance.halls,
      'days': instance.days,
    };

_$_Day _$$_DayFromJson(Map<String, dynamic> json) => _$_Day(
      type: json['@type'] as String,
      id: json['@id'] as String,
      date: DateTime.parse(json['date'] as String),
      eventGroups: (json['eventGroups'] as List<dynamic>)
          .map((e) => EventGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DayToJson(_$_Day instance) => <String, dynamic>{
      '@type': instance.type,
      '@id': instance.id,
      'date': instance.date.toIso8601String(),
      'eventGroups': instance.eventGroups,
    };

_$_EventGroup _$$_EventGroupFromJson(Map<String, dynamic> json) =>
    _$_EventGroup(
      type: json['@type'] as String,
      id: json['@id'] as String,
      columns: (json['columns'] as List<dynamic>)
          .map((e) => Hall.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_EventGroupToJson(_$_EventGroup instance) =>
    <String, dynamic>{
      '@type': instance.type,
      '@id': instance.id,
      'columns': instance.columns,
    };

_$_Hall _$$_HallFromJson(Map<String, dynamic> json) => _$_Hall(
      type: json['@type'] as String,
      id: json['@id'] as String,
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => ScheduleEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      accomodation: json['accomodation'] == null
          ? null
          : Hall.fromJson(json['accomodation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_HallToJson(_$_Hall instance) => <String, dynamic>{
      '@type': instance.type,
      '@id': instance.id,
      'events': instance.events,
      'name': instance.name,
      'accomodation': instance.accomodation,
    };

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      type: json['@type'] as String,
      id: json['@id'] as String,
      eventId: json['id'] as int,
      eventClass: json['class'] as String,
      title: json['title'] as String,
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
      children: (json['children'] as List<dynamic>)
          .map((e) => ScheduleEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      favourite: json['favourite'] as int?,
      isTimeHidden: json['isTimeHidden'] as bool,
      isRatable: json['isRatable'] as bool,
      structuredAuthors: json['structuredAuthors'] == null
          ? null
          : StructuredAuthors.fromJson(
              json['structuredAuthors'] as Map<String, dynamic>),
      body: json['body'] as String?,
      subtitle: json['subtitle'] as String?,
      chairs: json['chairs'] as String?,
      authors: (json['authors'] as List<dynamic>?)
          ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
      rate: (json['rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      '@type': instance.type,
      '@id': instance.id,
      'id': instance.eventId,
      'class': instance.eventClass,
      'title': instance.title,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'children': instance.children,
      'favourite': instance.favourite,
      'isTimeHidden': instance.isTimeHidden,
      'isRatable': instance.isRatable,
      'structuredAuthors': instance.structuredAuthors,
      'body': instance.body,
      'subtitle': instance.subtitle,
      'chairs': instance.chairs,
      'authors': instance.authors,
      'rate': instance.rate,
    };

_$_StructuredAuthors _$$_StructuredAuthorsFromJson(Map<String, dynamic> json) =>
    _$_StructuredAuthors(
      type: json['@type'] as String,
      id: json['@id'] as String,
      institutions: (json['institutions'] as List<dynamic>)
          .map((e) => Institution.fromJson(e as Map<String, dynamic>))
          .toList(),
      names: (json['names'] as List<dynamic>)
          .map((e) => Name.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMoreAuthors: json['hasMoreAuthors'] as bool,
    );

Map<String, dynamic> _$$_StructuredAuthorsToJson(
        _$_StructuredAuthors instance) =>
    <String, dynamic>{
      '@type': instance.type,
      '@id': instance.id,
      'institutions': instance.institutions,
      'names': instance.names,
      'hasMoreAuthors': instance.hasMoreAuthors,
    };

_$_Institution _$$_InstitutionFromJson(Map<String, dynamic> json) =>
    _$_Institution(
      name: json['name'] as String?,
      institutionId: json['institution_id'] as int?,
      needFix: json['need_fix'] as int?,
    );

Map<String, dynamic> _$$_InstitutionToJson(_$_Institution instance) =>
    <String, dynamic>{
      'name': instance.name,
      'institution_id': instance.institutionId,
      'need_fix': instance.needFix,
    };

_$_Name _$$_NameFromJson(Map<String, dynamic> json) => _$_Name(
      orig: json['orig'] as List<dynamic>,
      name: json['name'] as String,
      isPresenter: json['isPresenter'] as bool,
      profession: json['profession'],
      indexes: (json['indexes'] as List<dynamic>).map((e) => e as int).toList(),
      image: json['image'],
    );

Map<String, dynamic> _$$_NameToJson(_$_Name instance) => <String, dynamic>{
      'orig': instance.orig,
      'name': instance.name,
      'isPresenter': instance.isPresenter,
      'profession': instance.profession,
      'indexes': instance.indexes,
      'image': instance.image,
    };
