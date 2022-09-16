import 'package:eventapp/models/author_model.dart';
import 'package:eventapp/models/program_presentation_rate_model.dart';
import 'package:collection/collection.dart';

class ProgramItemModel {
  String iri;
  List<ProgramItemModel> children = [];
  Duration duration;
  String title;
  DateTime start;
  int? isLiked;
  DateTime end;
  ProgramPresentationRateModel? rate;
  int id;
  String type;
  String? body;
  String? chairs;
  List<AuthorModel> people;
  double rateValue;

  bool isRatable;

  ProgramItemModel({
    required this.id,
    required this.iri,
    required this.title,
    required this.duration,
    required this.rate,
    required this.rateValue,
    required this.start,
    required this.isLiked,
    required this.end,
    required this.children,
    required this.type,
    required this.people,
    required this.body,
    required this.chairs,
    required this.isRatable,
  });

  factory ProgramItemModel.fromJson(Map<String, dynamic> json) {
    DateTime startDate = DateTime.parse(json['from']);
    DateTime endDate = DateTime.parse(json['to']);
    return ProgramItemModel(
        id: json['id'],
        type: json['@type'],
        iri: json['@id'],
        title: json['title'] as String,
        body: json['body'] as String,
        start: startDate,
        end: endDate,
        isLiked: (json['presentationFavorites'] != null &&
                json['presentationFavorites'].isNotEmpty)
            ? (json['presentationFavorites'] as List)
                .map((e) => e['id'])
                .firstOrNull
            : null,
        rate: (json['presentationRates'] != null &&
                json['presentationRates'].isNotEmpty)
            ? (json['presentationRates'] as List)
                .map((p) => ProgramPresentationRateModel.fromJson(p))
                .first
            : null,
        rateValue: (json['presentationRates'] != null &&
                json['presentationRates'].isNotEmpty)
            ? (json['presentationRates'] as List)
                .map((p) => ProgramPresentationRateModel.fromJson(p))
                .first
                .rate
            : 0,
        duration:
            DateTime.parse(json['to']).difference(DateTime.parse(json['from'])),
        children: json['children'] != null
            ? (json['children'] as List)
                .map((p) => ProgramItemModel.fromJson(p))
                .toList()
            : [],
        people: json['people'] != null
            ? (json['people'] as List)
                .map((p) => AuthorModel.fromJson(p))
                .toList()
            : [],
        chairs: json['chairs'],
        isRatable: json['isRatable']);
  }

  get inProgress {
    final now = DateTime.now().toUtc().add(const Duration(hours: 2));
    return start.isBefore(now) && end.isAfter(now);
  }

  void toggleLike() {
    isLiked = isLiked != null ? null : -1;
  }
}
