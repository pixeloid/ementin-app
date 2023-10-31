// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../schedule_model.dart';
import 'workplace.dart';

part 'author.freezed.dart';
part 'author.g.dart';

@freezed
class Author with _$Author {
  const Author._();

  factory Author({
    @JsonKey(name: '@id') String? id,
    @JsonKey(name: 'id') int? authorId,
    @JsonKey(name: '@type') String? type,
    @JsonKey(name: '@description') String? description,
    @JsonKey(name: '@presentations') List<ScheduleEvent>? presentations,
    required String name,
    String? image,
    List<Workplace>? workplaces,
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  List<dynamic>? get presentationDays {
    return presentations
        ?.map(
          (e) => DateFormat('EEEE').format(e.start).toUpperCase(),
        )
        .toSet()
        .toList();
  }
}
