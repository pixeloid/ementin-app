class AuthorModel {
  final String iri;
  final int id;
  final String name;
  final String? title;
  final String? image;
  final String? workplace;
  final String? description;

  AuthorModel({
    required this.id,
    required this.iri,
    required this.name,
    this.title,
    this.image,
    this.workplace,
    this.description,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) => AuthorModel(
        id: json['id'],
        iri: json['@id'],
        name: json['name'] as String,
        image: json['image'],
        workplace: json['workplace'],
        description: json['description'],
      );
}
