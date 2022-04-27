import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticatedHttpClient extends http.BaseClient {
  late String? _inMemoryToken = '';

  final http.Client _httpClient = http.Client();

  AuthenticatedHttpClient();

  // Use a memory cache to avoid local storage access in each call
  getUserAccessToken() async {
    if (_inMemoryToken!.isNotEmpty) return _inMemoryToken;

    return _inMemoryToken = await _loadTokenFromSharedPreference();
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    final token = await getUserAccessToken();

    if (token != null) {
      request.headers.putIfAbsent('Authorization', () => 'Bearer $token');
    }

    return _httpClient.send(request);
  }

  _loadTokenFromSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('token') ?? '';
  }
}
