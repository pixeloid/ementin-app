// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'author_model.dart';
import 'program_presentation_rate_model.dart';

part 'program_item_model.freezed.dart';
part 'program_item_model.g.dart';

@freezed
class ProgramItemModel with _$ProgramItemModel {
  const ProgramItemModel._();

  factory ProgramItemModel({
    required int id,
    @Default('') @JsonKey(name: '@id') String iri,
    @Default([]) List<ProgramItemModel> children,
    @Default(Duration(minutes: 0)) Duration duration,
    required String title,
    @JsonKey(name: 'from') required DateTime start,
    @JsonKey(name: 'to') required DateTime end,
    bool? isFavourite,
    ProgramPresentationRateModel? rate,
    String? type,
    String? body,
    String? chairs,
    @Default([]) List<AuthorModel> people,
    double? rateValue,
    @Default(false) bool isRatable,
    @Default(false) bool isTimeHidden,
  }) = _ProgramItemModel;

  factory ProgramItemModel.fromJson(Map<String, Object?> json) =>
      _$ProgramItemModelFromJson(json);

  get inProgress {
    final now = DateTime.now();

    return start.isBefore(now) && end.isAfter(now);
  }
}
