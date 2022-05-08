import 'package:eventapp/models/program_presentation_model.dart';
import 'package:intl/intl.dart';

class ProgramSectionModel {
  final String iri;
  final int id;
  final String name;
  final List<ProgramPresentationModel> presentations;
  Duration duration;
  String start;

  ProgramSectionModel({
    required this.id,
    required this.iri,
    required this.duration,
    required this.name,
    required this.start,
    required this.presentations,
  });

  factory ProgramSectionModel.fromJson(Map<String, dynamic> json) =>
      ProgramSectionModel(
        id: json['id'],
        iri: json['@id'],
        name: json['name'] as String,
        start: DateFormat('Hm').format(DateTime.parse(json['start'])),
        duration: DateTime.parse(json['end'])
            .difference(DateTime.parse(json['start'])),
        presentations: (json['presentations'] as List)
            .map((p) => ProgramPresentationModel.fromJson(p))
            .toList(),
      );
}
