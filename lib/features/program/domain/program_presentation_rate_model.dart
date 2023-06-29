import 'package:flutter/widgets.dart';

class ProgramPresentationRateModel {
  GlobalKey key;
  final String iri;
  final int id;
  double rate;

  ProgramPresentationRateModel({
    required this.key,
    required this.iri,
    required this.id,
    required this.rate,
  });

  factory ProgramPresentationRateModel.fromJson(Map<String, dynamic> json) {
    return ProgramPresentationRateModel(
      key: GlobalKey(),
      id: json['id'],
      iri: json['@id'],
      rate: json['value'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "rate": rate,
      };
}
