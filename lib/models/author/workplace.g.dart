// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workplace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Workplace _$$_WorkplaceFromJson(Map<String, dynamic> json) => _$_Workplace(
      id: json['@id'] as String?,
      type: json['@type'] as String?,
      name: json['@name'] as String?,
      workplace: json['workplace'] == null
          ? null
          : Workplace.fromJson(json['workplace'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WorkplaceToJson(_$_Workplace instance) =>
    <String, dynamic>{
      '@id': instance.id,
      '@type': instance.type,
      '@name': instance.name,
      'workplace': instance.workplace,
    };
