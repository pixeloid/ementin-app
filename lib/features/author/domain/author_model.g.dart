// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthorModel _$$_AuthorModelFromJson(Map<String, dynamic> json) =>
    _$_AuthorModel(
      id: json['id'] as int?,
      iri: json['@id'] ?? '',
      name: json['name'] as String,
      title: json['title'] as String?,
      image: json['image'] as String?,
      workplace: json['workplace'] as String?,
      description: json['description'] as String?,
      presentationIris: json['presentationIris'] as List<dynamic>? ?? const [],
      presentations: (json['presentations'] as List<dynamic>?)
              ?.map((e) => ProgramItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_AuthorModelToJson(_$_AuthorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      '@id': instance.iri,
      'name': instance.name,
      'title': instance.title,
      'image': instance.image,
      'workplace': instance.workplace,
      'description': instance.description,
      'presentationIris': instance.presentationIris,
      'presentations': instance.presentations,
    };
