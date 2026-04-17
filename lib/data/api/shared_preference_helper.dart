import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String token = "token";
  static const String rfToken = "refresh_token";
  static const String checkinCode = "checkin_code";
  final SharedPreferences prefs;

  SharedPreferenceHelper({required this.prefs});

  Future<void> setUserToken({required String userToken}) async {
    await prefs.setString(token, userToken);
  }

  Future<void> setRefreshToken({required String refreshToken}) async {
    await prefs.setString(rfToken, refreshToken);
  }

  Future<void> setCheckinCode({required String code}) async {
    await prefs.setString(checkinCode, code);
  }

  String? getUserToken() {
    return prefs.getString(token);
  }

  String? getRefreshToken() {
    return prefs.getString(rfToken);
  }

  String? getCheckinCode() {
    return prefs.getString(checkinCode);
  }
}
