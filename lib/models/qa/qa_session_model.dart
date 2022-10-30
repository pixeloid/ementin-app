import 'dart:convert';

import 'package:collection/collection.dart';

import 'qa_entry.dart';

class QASessionModel {
  final String? context;
  final String? iri;
  final String? type;
  final int? id;
  final String? name;
  late bool active;
  late List<QaEntry>? qAEntries;
  final String? created;
  final String? updated;
  final String? date;

  QASessionModel({
    this.context,
    this.iri,
    this.type,
    this.id,
    this.name,
    required this.active,
    this.qAEntries,
    this.created,
    this.updated,
    this.date,
  });

  @override
  String toString() {
    return 'QASessionModel(context: $context, id: $id, type: $type, id: $id, name: $name, active: $active, qAEntries: $qAEntries, created: $created, updated: $updated, date: $date)';
  }

  factory QASessionModel.fromMap(Map<String, dynamic> data) {
    return QASessionModel(
      context: data['@context'] as String?,
      iri: data['@id'] as String?,
      type: data['@type'] as String?,
      id: data['id'] as int?,
      name: data['name'] as String?,
      active: data['active'] as bool,
      qAEntries: (data['qAEntries'] as List<dynamic>?)
          ?.map((e) => QaEntry.fromMap(e as Map<String, dynamic>))
          .toList(),
      created: data['created'] as String?,
      updated: data['updated'] as String?,
      date: data['@date'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        '@context': context,
        '@id': id,
        '@type': type,
        'id': id,
        'name': name,
        'active': active,
        'qAEntries': qAEntries?.map((e) => e.toMap()).toList(),
        'created': created,
        'updated': updated,
        '@date': date,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [QASessionModel].
  factory QASessionModel.fromJson(String data) {
    return QASessionModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [QASessionModel] to a JSON string.
  String toJson() => json.encode(toMap());

  QASessionModel copyWith({
    String? context,
    String? iri,
    String? type,
    int? id,
    String? name,
    bool? active,
    List<QaEntry>? qAEntries,
    String? created,
    String? updated,
    String? date,
  }) {
    return QASessionModel(
      context: context ?? this.context,
      iri: iri ?? this.iri,
      type: type ?? this.type,
      id: id ?? this.id,
      name: name ?? this.name,
      active: active ?? this.active,
      qAEntries: qAEntries ?? this.qAEntries,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      date: date ?? this.date,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! QASessionModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      context.hashCode ^
      id.hashCode ^
      type.hashCode ^
      id.hashCode ^
      name.hashCode ^
      active.hashCode ^
      qAEntries.hashCode ^
      created.hashCode ^
      updated.hashCode ^
      date.hashCode;
}
