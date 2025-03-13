// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Author _$AuthorFromJson(Map<String, dynamic> json) => _Author(
      id: json['@id'] as String?,
      authorId: (json['id'] as num?)?.toInt(),
      type: json['@type'] as String?,
      description: json['@description'] as String?,
      presentations: (json['@presentations'] as List<dynamic>?)
          ?.map((e) => ScheduleEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      image: json['image'] as String?,
      workplaces: (json['workplaces'] as List<dynamic>?)
          ?.map((e) => Workplace.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AuthorToJson(_Author instance) => <String, dynamic>{
      '@id': instance.id,
      'id': instance.authorId,
      '@type': instance.type,
      '@description': instance.description,
      '@presentations': instance.presentations,
      'name': instance.name,
      'image': instance.image,
      'workplaces': instance.workplaces,
    };
