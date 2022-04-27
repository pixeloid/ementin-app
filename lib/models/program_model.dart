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

class ProgramSectionModel {
  final GlobalKey key;
  final String id;
  final String name;
  bool isLiked;
  int? rating;
  Duration duration;
  String start;

  ProgramSectionModel({
    required this.name,
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
        name: json['name'] as String,
        isLiked: false,
        rating: null,
        start: DateFormat('Hm').format(DateTime.parse(json['start'])),
        duration: DateTime.parse(json['end'])
            .difference(DateTime.parse(json['start'])),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "isLiked": isLiked,
      };

  void toggleLike() {
    isLiked = !isLiked;
  }
}
