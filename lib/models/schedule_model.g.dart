// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Schedule _$ScheduleFromJson(Map<String, dynamic> json) => _Schedule(
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

Map<String, dynamic> _$ScheduleToJson(_Schedule instance) => <String, dynamic>{
      '@context': instance.context,
      '@id': instance.id,
      '@type': instance.type,
      'halls': instance.halls,
      'days': instance.days,
    };

_Day _$DayFromJson(Map<String, dynamic> json) => _Day(
      type: json['@type'] as String,
      id: json['@id'] as String,
      origDate: DateTime.parse(json['date'] as String),
      eventGroups: (json['eventGroups'] as List<dynamic>)
          .map((e) => EventGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DayToJson(_Day instance) => <String, dynamic>{
      '@type': instance.type,
      '@id': instance.id,
      'date': instance.origDate.toIso8601String(),
      'eventGroups': instance.eventGroups,
    };

_EventGroup _$EventGroupFromJson(Map<String, dynamic> json) => _EventGroup(
      type: json['@type'] as String,
      id: json['@id'] as String,
      columns: (json['columns'] as List<dynamic>)
          .map((e) => Hall.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventGroupToJson(_EventGroup instance) =>
    <String, dynamic>{
      '@type': instance.type,
      '@id': instance.id,
      'columns': instance.columns,
    };

_Hall _$HallFromJson(Map<String, dynamic> json) => _Hall(
      type: json['@type'] as String,
      id: json['@id'] as String,
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => ScheduleEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      color: json['color'] as String?,
      accomodation: json['accomodation'] == null
          ? null
          : Hall.fromJson(json['accomodation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HallToJson(_Hall instance) => <String, dynamic>{
      '@type': instance.type,
      '@id': instance.id,
      'events': instance.events,
      'name': instance.name,
      'color': instance.color,
      'accomodation': instance.accomodation,
    };

_ScheduleEvent _$ScheduleEventFromJson(Map<String, dynamic> json) =>
    _ScheduleEvent(
      type: json['@type'] as String,
      id: json['@id'] as String,
      eventId: (json['id'] as num).toInt(),
      eventClass: json['class'] as String,
      title: json['title'] as String,
      originalStart: DateTime.parse(json['start'] as String),
      originalEnd: DateTime.parse(json['end'] as String),
      children: (json['children'] as List<dynamic>?)
              ?.map((e) => ScheduleEvent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      favourite: (json['favourite'] as num?)?.toInt(),
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
      media: json['media'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ScheduleEventToJson(_ScheduleEvent instance) =>
    <String, dynamic>{
      '@type': instance.type,
      '@id': instance.id,
      'id': instance.eventId,
      'class': instance.eventClass,
      'title': instance.title,
      'start': instance.originalStart.toIso8601String(),
      'end': instance.originalEnd.toIso8601String(),
      'children': instance.children,
      'favourite': instance.favourite,
      'isTimeHidden': instance.isTimeHidden,
      'isRatable': instance.isRatable,
      'structuredAuthors': instance.structuredAuthors,
      'body': instance.body,
      'subtitle': instance.subtitle,
      'chairs': instance.chairs,
      'authors': instance.authors,
      'media': instance.media,
      'rate': instance.rate,
    };

_StructuredAuthors _$StructuredAuthorsFromJson(Map<String, dynamic> json) =>
    _StructuredAuthors(
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

Map<String, dynamic> _$StructuredAuthorsToJson(_StructuredAuthors instance) =>
    <String, dynamic>{
      '@type': instance.type,
      '@id': instance.id,
      'institutions': instance.institutions,
      'names': instance.names,
      'hasMoreAuthors': instance.hasMoreAuthors,
    };

_Institution _$InstitutionFromJson(Map<String, dynamic> json) => _Institution(
      name: json['name'] as String?,
      institutionId: (json['institution_id'] as num?)?.toInt(),
      needFix: (json['need_fix'] as num?)?.toInt(),
    );

Map<String, dynamic> _$InstitutionToJson(_Institution instance) =>
    <String, dynamic>{
      'name': instance.name,
      'institution_id': instance.institutionId,
      'need_fix': instance.needFix,
    };

_Name _$NameFromJson(Map<String, dynamic> json) => _Name(
      orig: json['orig'] as List<dynamic>,
      name: json['name'] as String,
      isPresenter: json['isPresenter'] as bool,
      profession: json['profession'],
      indexes: (json['indexes'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      image: json['image'],
    );

Map<String, dynamic> _$NameToJson(_Name instance) => <String, dynamic>{
      'orig': instance.orig,
      'name': instance.name,
      'isPresenter': instance.isPresenter,
      'profession': instance.profession,
      'indexes': instance.indexes,
      'image': instance.image,
    };
