class ProgramDayModel {
  final String dayname;

  ProgramDayModel({
    required this.dayname,
  });

  factory ProgramDayModel.fromJson(Map<String, dynamic> json) =>
      ProgramDayModel(
        dayname: json['name'] as String,
      );
}

class ProgramModel {
  ProgramModel({
    required this.name,
    required this.id,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json) => ProgramModel(
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
