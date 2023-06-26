import 'package:eventapp/data/api/dio_client.dart';
import 'package:eventapp/data/repository/auth_repository.dart';
import 'package:eventapp/data/repository/author_repository.dart';
import 'package:eventapp/data/repository/event_repository.dart';
import 'package:eventapp/data/repository/insta_repository.dart';
import 'package:eventapp/data/repository/program_repository.dart';
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
  getIt.registerSingleton<AuthorRepository>(AuthorRepository());
  getIt.registerSingleton<EventProvider>(EventProvider(EventRepository()));
}
