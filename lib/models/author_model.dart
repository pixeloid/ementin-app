class AuthorModel {
  final String iri;
  final int id;
  final String name;
  final String? title;
  final String? image;
  final String? workplace;
  final String? description;
  List<dynamic> presentations = [];

  AuthorModel({
    required this.id,
    required this.iri,
    required this.name,
    this.title,
    this.image,
    this.workplace,
    this.description,
    required this.presentations,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) => AuthorModel(
        id: json['id'],
        iri: json['@id'],
        name: json['name'] as String,
        image: json['image'],
        workplace: json['workplace'],
        description: json['description'],
        presentations: json['presentations'] != null
            ? (json['presentations'] as List).map((e) => e['@id']).toList()
            : [],
      );
}
