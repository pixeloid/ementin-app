// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'workplace.freezed.dart';
part 'workplace.g.dart';

@freezed
class Workplace with _$Workplace {
  factory Workplace({
    @JsonKey(name: '@id') String? id,
    @JsonKey(name: '@type') String? type,
    @JsonKey(name: '@name') String? name,
    Workplace? workplace,
  }) = _Workplace;

  factory Workplace.fromJson(Map<String, dynamic> json) =>
      _$WorkplaceFromJson(json);
}
