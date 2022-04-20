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
  final String id;
  final String name;
  bool isLiked;

  ProgramModel({
    required this.name,
    required this.id,
    required this.isLiked,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json) => ProgramModel(
        id: json['id'] as String,
        name: json['name'] as String,
        isLiked: false,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "isLiked": isLiked,
      };

  void toggleLike() {
    isLiked = !isLiked;
  }
}
