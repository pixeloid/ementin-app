// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institution_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InstitutionGroup _$InstitutionGroupFromJson(Map<String, dynamic> json) =>
    _InstitutionGroup(
      id: json['@id'] as String?,
      type: json['@type'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$InstitutionGroupToJson(_InstitutionGroup instance) =>
    <String, dynamic>{
      '@id': instance.id,
      '@type': instance.type,
      'name': instance.name,
    };
