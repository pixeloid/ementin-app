import 'package:eventapp/data/api/dio_client.dart';
import 'package:eventapp/data/api/repository/auth_repository.dart';
import 'package:eventapp/data/api/shared_preference_helper.dart';
import 'package:eventapp/providers/auth_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
//
Future<void> setup() async {
  final _prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferenceHelper>(
    SharedPreferenceHelper(prefs: _prefs),
  );
  getIt.registerSingleton<DioClient>(DioClient());
  getIt.registerSingleton<AuthProvider>(AuthProvider(AuthRepository()));
}
