import 'dart:convert';

import 'package:equatable/equatable.dart';

class Event extends Equatable {
  final String? iri;
  final int? id;
  final String? name;
  final String? start;
  final String? end;
  final String? venue;
  final String? deadline;
  final String? abstractDeadline;
  final String? image;

  const Event({
    this.iri,
    this.id,
    this.name,
    this.start,
    this.end,
    this.venue,
    this.deadline,
    this.abstractDeadline,
    this.image,
  });

  factory Event.fromMap(Map<String, dynamic> data) => Event(
        iri: data['iri'] as String?,
        id: data['id'] as int?,
        name: data['name'] as String?,
        start: data['start'] as String?,
        end: data['end'] as String?,
        venue: data['venue'] as String?,
        deadline: data['deadline'] as String?,
        abstractDeadline: data['abstractDeadline'] as String?,
        image: data['image'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'iri': iri,
        'id': id,
        'name': name,
        'start': start,
        'end': end,
        'venue': venue,
        'deadline': deadline,
        'abstractDeadline': abstractDeadline,
        'image': image,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Event].
  factory Event.fromJson(String data) {
    return Event.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Event] to a JSON string.
  String toJson() => json.encode(toMap());

  Event copyWith({
    String? iri,
    int? id,
    String? name,
    String? start,
    String? end,
    String? venue,
    String? deadline,
    String? abstractDeadline,
    String? image,
  }) {
    return Event(
      iri: iri ?? this.iri,
      id: id ?? this.id,
      name: name ?? this.name,
      start: start ?? this.start,
      end: end ?? this.end,
      venue: venue ?? this.venue,
      deadline: deadline ?? this.deadline,
      abstractDeadline: abstractDeadline ?? this.abstractDeadline,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props {
    return [
      iri,
      id,
      name,
      start,
      end,
      venue,
      deadline,
      abstractDeadline,
      image,
    ];
  }
}
