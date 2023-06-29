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
    required String iri,
    @Default([]) List<ProgramItemModel> children,
    required Duration duration,
    required String title,
    required DateTime start,
    int? isLiked,
    required DateTime end,
    ProgramPresentationRateModel? rate,
    String? type,
    String? body,
    String? chairs,
    @Default([]) List<AuthorModel> people,
    double? rateValue,
    required bool isRatable,
    required bool isTimeHidden,
  }) = _ProgramItemModel;

  factory ProgramItemModel.fromJson(Map<String, Object?> json) =>
      _$ProgramItemModelFromJson(json);

  get inProgress {
    final now = DateTime.now();

    return start.isBefore(now) && end.isAfter(now);
  }
}
