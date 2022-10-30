import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

@immutable
class QaEntry {
  final String? iri;
  final String? type;
  final int? id;
  final String content;
  final String? user;
  final bool? active;
  final DateTime created;
  final DateTime updated;
  final DateTime date;

  const QaEntry({
    this.iri,
    this.type,
    this.id,
    required this.content,
    this.user,
    this.active,
    required this.created,
    required this.updated,
    required this.date,
  });

  get isMine => false;

  @override
  String toString() {
    return 'QaEntry(iri: $iri, type: $type, id: $id, content: $content, user: $user, active: $active, created: $created, updated: $updated, date: $date)';
  }

  factory QaEntry.fromMap(Map<String, dynamic> data) => QaEntry(
        iri: data['@id'] as String?,
        type: data['@type'] as String?,
        id: data['id'] as int?,
        content: data['content'] as String,
        user: 'Kiss Pista',
        active: data['active'] as bool?,
        created: DateTime.parse(data['created']),
        updated: DateTime.parse(data['updated']),
        date: DateTime.parse(data['@date']),
      );

  Map<String, dynamic> toMap() => {
        '@id': id,
        '@type': type,
        'id': id,
        'content': content,
        'user': user,
        'active': active,
        'created': created,
        'updated': updated,
        '@date': date,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [QaEntry].
  factory QaEntry.fromJson(String data) {
    return QaEntry.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [QaEntry] to a JSON string.
  String toJson() => json.encode(toMap());

  QaEntry copyWith({
    String? iri,
    String? type,
    int? id,
    String? content,
    String? user,
    bool? active,
    DateTime? created,
    DateTime? updated,
    DateTime? date,
  }) {
    return QaEntry(
      id: id ?? this.id,
      type: type ?? this.type,
      iri: iri ?? this.iri,
      content: content ?? this.content,
      user: user ?? this.user,
      active: active ?? this.active,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      date: date ?? this.date,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! QaEntry) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      type.hashCode ^
      id.hashCode ^
      content.hashCode ^
      user.hashCode ^
      active.hashCode ^
      created.hashCode ^
      updated.hashCode ^
      date.hashCode;
}
