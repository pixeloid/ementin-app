import 'package:eventapp/data/api/dio_client.dart';
import 'package:eventapp/data/api/repository/auth_repository.dart';
import 'package:eventapp/data/api/repository/event_repository.dart';
import 'package:eventapp/data/api/repository/insta_repository.dart';
import 'package:eventapp/data/api/repository/program_repository.dart';
import 'package:eventapp/data/api/repository/qa_repository.dart';
import 'package:eventapp/data/api/shared_preference_helper.dart';
import 'package:eventapp/providers/auth_provider.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
//
Future<void> setup() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferenceHelper>(
    SharedPreferenceHelper(prefs: prefs),
  );
  getIt.registerSingleton<DioClient>(DioClient());
  getIt.registerSingleton<AuthProvider>(AuthProvider(AuthRepository()));
  getIt.registerSingleton<InstaRepository>(InstaRepository());
  getIt.registerSingleton<ProgramRepository>(ProgramRepository());
  getIt.registerSingleton<QARepository>(QARepository());
  getIt.registerSingleton<EventProvider>(EventProvider(EventRepository()));
}
