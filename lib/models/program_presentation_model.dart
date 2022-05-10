import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

class ProgramPresentationModel {
  final String iri;
  final int id;
  final String title;
  int? isLiked;
  int? rating;
  Duration? duration;
  String start;
  GlobalKey key;

  ProgramPresentationModel({
    required this.title,
    required this.iri,
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
        id: json['id'],
        iri: json['@id'],
        title: json['title'] as String,
        isLiked: (json['presentationFavorites'] as List)
            .map((e) => e['id'])
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
