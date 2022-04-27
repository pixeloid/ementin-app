class MessageModel {
  MessageModel({
    required this.name,
    required this.id,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
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
