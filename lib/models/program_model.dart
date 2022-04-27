import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ProgramDayModel {
  final String dayname;

  ProgramDayModel({
    required this.dayname,
  });

  factory ProgramDayModel.fromJson(Map<String, dynamic> json) =>
      ProgramDayModel(
        dayname: json['name'] as String,
      );
}

class SectionModel {
  final String id;
  final String name;
  final List<ProgramModel> program;
  Duration duration;
  String start;

  SectionModel({
    required this.id,
    required this.duration,
    required this.name,
    required this.start,
    required this.program,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
        id: json['id'] as String,
        name: json['name'] as String,
        start: DateFormat('Hm').format(DateTime.parse(json['start'])),
        duration: DateTime.parse(json['end'])
            .difference(DateTime.parse(json['start'])),
        program: (json['presentations']['edges'] as List)
            .map((p) => ProgramModel.fromJson(p['node']))
            .toList(),
      );
}

class ProgramModel {
  final String id;
  final String title;
  bool isLiked;
  int? rating;
  Duration duration;
  String start;

  ProgramModel({
    required this.title,
    required this.id,
    required this.isLiked,
    required this.rating,
    required this.start,
    required this.duration,
    required this.key,
  });

  factory ProgramSectionModel.fromJson(Map<String, dynamic> json) =>
      ProgramSectionModel(
        key: GlobalKey(),
        id: json['id'] as String,
        title: json['title'] as String,
        isLiked: false,
        rating: null,
        start: DateFormat('Hm').format(DateTime.parse(json['start'])),
        duration: DateTime.parse(json['end'])
            .difference(DateTime.parse(json['start'])),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "id": id,
        "isLiked": isLiked,
      };

  void toggleLike() {
    isLiked = !isLiked;
  }
}
