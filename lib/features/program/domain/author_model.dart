import 'package:eventapp/features/program/domain/program_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'author_model.freezed.dart';
part 'author_model.g.dart';

@freezed
class AuthorModel with _$AuthorModel {
  AuthorModel._();
  factory AuthorModel({
    String? iri,
    int? id,
    required String name,
    String? title,
    String? image,
    String? workplace,
    String? description,
    @Default([]) List<dynamic> presentationIris,
    @Default([]) List<ProgramItemModel> presentations,
  }) = _AuthorModel;

  factory AuthorModel.fromJson(Map<String, Object?> json) =>
      _$AuthorModelFromJson(json);

  List<dynamic> get presentationDays {
    return presentations
        .map(
          (e) => DateFormat('EEEE', 'hu').format(e.start).toUpperCase(),
        )
        .toSet()
        .toList();
  }
}
