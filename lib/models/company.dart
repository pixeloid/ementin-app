import 'dart:convert';

class Company {
  String name;
  List<dynamic>? logo;

  Company({required this.name, this.logo});

  factory Company.fromMap(Map<String, dynamic> data) => Company(
        name: data['name'] as String,
        logo: data['logo'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'logo': logo,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Company].
  factory Company.fromJson(String data) {
    return Company.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Company] to a JSON string.
  String toJson() => json.encode(toMap());
}
