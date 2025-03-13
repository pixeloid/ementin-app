import 'dart:convert';

import 'sponsor.dart';

class SponsorCategory {
  String? name;
  List<Sponsor>? sponsors;

  SponsorCategory({this.name, this.sponsors});

  factory SponsorCategory.fromMap(Map<String, dynamic> data) {
    return SponsorCategory(
      name: data['name'] as String?,
      sponsors: (data['sponsors'] as List<dynamic>?)
          ?.map((e) => Sponsor.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'sponsors': sponsors?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SponsorCategory].
  factory SponsorCategory.fromJson(String data) {
    return SponsorCategory.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SponsorCategory] to a JSON string.
  String toJson() => json.encode(toMap());
}
