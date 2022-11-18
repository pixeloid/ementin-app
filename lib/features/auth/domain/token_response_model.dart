import 'dart:convert';

class TokenResponseModel {
  String token;
  String refreshToken;

  TokenResponseModel({required this.token, required this.refreshToken});

  @override
  String toString() {
    return 'TokenResponseModel(token: $token, refreshToken: $refreshToken)';
  }

  factory TokenResponseModel.fromMap(Map<String, dynamic> data) {
    return TokenResponseModel(
      token: data['token'] as String,
      refreshToken: data['refresh_token'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        'token': token,
        'refresh_token': refreshToken,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TokenResponseModel].
  factory TokenResponseModel.fromJson(String data) {
    return TokenResponseModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TokenResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
