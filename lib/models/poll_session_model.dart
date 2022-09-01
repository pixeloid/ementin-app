import 'dart:convert';

import 'package:eventapp/models/poll_model.dart';

List<PollSessionModel> pollSessionModelFromJson(String str) {
  final jsonData = json.decode(str);
  return List<PollSessionModel>.from(
      jsonData.map((x) => PollSessionModel.fromJson(x)));
}

String pollSessionModelToJson(List<PollSessionModel> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class PollSessionModel {
  int id;
  String iri;
  PollModel poll;
  bool closed;

  PollSessionModel(
      {required this.id,
      required this.poll,
      required this.closed,
      required this.iri});

  factory PollSessionModel.fromJson(Map<String, dynamic> json) =>
      PollSessionModel(
        id: json["id"],
        iri: json["@id"],
        poll: PollModel.fromJson(json["poll"]),
        closed: json["ended"] != null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "poll": poll.toJson(),
      };
}
