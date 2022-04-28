import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticatedHttpClient extends http.BaseClient {
  String? _inMemoryToken;

  final http.Client _httpClient = http.Client();

  AuthenticatedHttpClient();

  // Use a memory cache to avoid local storage access in each call
  getUserAccessToken() async {
    if (_inMemoryToken != null) return _inMemoryToken;

    final sharedPrefs = await _getSharedPreferences();

    return _inMemoryToken = sharedPrefs.getString('token');
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final token = await getUserAccessToken();

    if (token != null) {
      request.headers.putIfAbsent('Authorization', () => 'Bearer $token');
    }

    return _httpClient.send(request);
  }

  Future<SharedPreferences> _getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }
}
