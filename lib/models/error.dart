class ErrorModel {
  int statusCode;
  String statusMessage;
  String description;

  ErrorModel(this.statusCode, this.statusMessage, this.description);

  factory ErrorModel.fromJson(Map<String, dynamic> json, int? statusCode) =>
      ErrorModel(
        statusCode as int,
        json['hydra:title'] as String,
        json['hydra:description'] as String,
      );

  Map<String, dynamic> toJson(ErrorModel instance) => <String, dynamic>{
        'status_code': instance.statusCode,
        'status_message': instance.statusMessage,
      };
}
