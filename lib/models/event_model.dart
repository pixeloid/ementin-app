class EventModel {
  final String id;
  final String name;
  final bool checkedIn;

  EventModel({
    required this.name,
    required this.id,
    required this.checkedIn,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json['id'] as String,
        name: json['name'] as String,
        checkedIn: true,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
