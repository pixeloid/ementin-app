// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProgramItemModel _$$_ProgramItemModelFromJson(Map<String, dynamic> json) =>
    _$_ProgramItemModel(
      id: json['id'] as int,
      iri: json['iri'] as String,
      children: (json['children'] as List<dynamic>?)
              ?.map((e) => ProgramItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      duration: Duration(microseconds: json['duration'] as int),
      title: json['title'] as String,
      start: DateTime.parse(json['start'] as String),
      isLiked: json['isLiked'] as int?,
      end: DateTime.parse(json['end'] as String),
      rate: json['rate'] == null
          ? null
          : ProgramPresentationRateModel.fromJson(
              json['rate'] as Map<String, dynamic>),
      type: json['type'] as String?,
      body: json['body'] as String?,
      chairs: json['chairs'] as String?,
      people: (json['people'] as List<dynamic>?)
              ?.map((e) => AuthorModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      rateValue: (json['rateValue'] as num?)?.toDouble(),
      isRatable: json['isRatable'] as bool,
      isTimeHidden: json['isTimeHidden'] as bool,
    );

Map<String, dynamic> _$$_ProgramItemModelToJson(_$_ProgramItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'iri': instance.iri,
      'children': instance.children,
      'duration': instance.duration.inMicroseconds,
      'title': instance.title,
      'start': instance.start.toIso8601String(),
      'isLiked': instance.isLiked,
      'end': instance.end.toIso8601String(),
      'rate': instance.rate,
      'type': instance.type,
      'body': instance.body,
      'chairs': instance.chairs,
      'people': instance.people,
      'rateValue': instance.rateValue,
      'isRatable': instance.isRatable,
      'isTimeHidden': instance.isTimeHidden,
    };
