class EventRegistrationModel {
  final int id;
  final String iri;
  final String firstname;
  final String lastname;

  EventRegistrationModel({
    required this.id,
    required this.iri,
    required this.firstname,
    required this.lastname,
  });

  factory EventRegistrationModel.fromJson(json) {
    return EventRegistrationModel(
      id: json['id'],
      iri: json['@id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
    );
  }

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "id": id,
      };
}
