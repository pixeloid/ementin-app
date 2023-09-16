// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'institution_group.freezed.dart';
part 'institution_group.g.dart';

@freezed
class InstitutionGroup with _$InstitutionGroup {
  factory InstitutionGroup({
    @JsonKey(name: '@id') String? id,
    @JsonKey(name: '@type') String? type,
    String? name,
  }) = _InstitutionGroup;

  factory InstitutionGroup.fromJson(Map<String, dynamic> json) =>
      _$InstitutionGroupFromJson(json);
}
