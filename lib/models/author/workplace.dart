// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'workplace.freezed.dart';
part 'workplace.g.dart';

@freezed
abstract class Workplace with _$Workplace {
  const factory Workplace({
    @JsonKey(name: '@id') String? id,
    @JsonKey(name: '@type') String? type,
    @JsonKey(name: '@name') String? name,
  }) = _Workplace;

  factory Workplace.fromJson(Map<String, dynamic> json) =>
      _$WorkplaceFromJson(json);
}
