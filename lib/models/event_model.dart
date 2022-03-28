class EventModel {
  EventModel({
    required this.name,
    required this.id,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json['id'] as String,
        name: json['name'] as String,
      );

  final String id;
  final String name;

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
