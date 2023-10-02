import 'dart:convert';

import 'company.dart';

class Sponsor {
  Company company;
  List<dynamic>? materialUrls;
  String? logoUrl;

  Sponsor({required this.company, this.materialUrls, this.logoUrl});

  factory Sponsor.fromMap(Map<String, dynamic> data) => Sponsor(
        company: Company.fromMap(data['company'] as Map<String, dynamic>),
        materialUrls: data['materialUrls'] as List<dynamic>?,
        logoUrl: data['logoUrl'],
      );

  Map<String, dynamic> toMap() => {
        'company': company.toMap(),
        'materialUrls': materialUrls,
        'logoUrl': logoUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Sponsor].
  factory Sponsor.fromJson(String data) {
    return Sponsor.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Sponsor] to a JSON string.
  String toJson() => json.encode(toMap());
}
