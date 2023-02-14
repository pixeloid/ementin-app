class ErrorModel {
  int statusCode;
  String statusMessage;
  String description;

  ErrorModel(this.statusCode, this.statusMessage, this.description);

  factory ErrorModel.fromJson(Map<String, dynamic> json, int? statusCode) =>
      ErrorModel(
        statusCode as int,
        json['hydra:title'] ?? json['message'] as String,
        json['hydra:description'] ?? '',
      );

  Map<String, dynamic> toJson(ErrorModel instance) => <String, dynamic>{
        'status_code': instance.statusCode,
        'status_message': instance.statusMessage,
      };
}
