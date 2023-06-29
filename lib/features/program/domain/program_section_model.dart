import 'package:intl/intl.dart';

import 'program_presentation_model.dart';

class ProgramSectionModel {
  final String iri;
  final int id;
  final String name;
  List<ProgramPresentationModel> presentations = [];
  Duration duration;
  String start;
  String end;

  ProgramSectionModel({
    required this.id,
    required this.iri,
    required this.duration,
    required this.name,
    required this.start,
    required this.end,
    required this.presentations,
  });

  factory ProgramSectionModel.fromJson(Map<String, dynamic> json) =>
      ProgramSectionModel(
        id: json['id'],
        iri: json['@id'],
        name: json['title'] as String,
        start: DateFormat('Hm').format(DateTime.parse(json['from'])),
        end: DateFormat('Hm').format(DateTime.parse(json['to'])),
        duration:
            DateTime.parse(json['to']).difference(DateTime.parse(json['from'])),
        presentations: json['children'] != null
            ? (json['children'] as List)
                .map((p) => ProgramPresentationModel.fromJson(p))
                .toList()
            : [],
      );
}
