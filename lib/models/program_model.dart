import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

class ProgramSectionModel {
  final String id;
  final String name;
  final List<ProgramPresentationModel> presentations;
  Duration duration;
  String start;

  ProgramSectionModel({
    required this.id,
    required this.duration,
    required this.name,
    required this.start,
    required this.presentations,
  });

  factory ProgramSectionModel.fromJson(Map<String, dynamic> json) =>
      ProgramSectionModel(
        id: json['id'] as String,
        name: json['name'] as String,
        start: DateFormat('Hm').format(DateTime.parse(json['start'])),
        duration: DateTime.parse(json['end'])
            .difference(DateTime.parse(json['start'])),
        presentations: (json['presentations']['edges'] as List)
            .map((p) => ProgramPresentationModel.fromJson(p['node']))
            .toList(),
      );
}

class ProgramPresentationModel {
  final String id;
  final String title;
  int? isLiked;
  int? rating;
  Duration duration;
  String start;
  GlobalKey key;

  ProgramPresentationModel({
    required this.title,
    required this.id,
    required this.isLiked,
    required this.rating,
    required this.start,
    required this.duration,
    required this.key,
  });

  factory ProgramPresentationModel.fromJson(Map<String, dynamic> json) =>
      ProgramPresentationModel(
        key: GlobalKey(),
        id: json['id'] as String,
        title: json['title'] as String,
        isLiked: (json['presentationFavorites']['edges'] as List)
            .map((e) => e['node']['_id'])
            .firstOrNull,
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
    isLiked = isLiked != null ? null : -1;
  }
}
