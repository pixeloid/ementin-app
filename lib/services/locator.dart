import 'package:ementin_flutter/data/api/dio_client.dart';
import 'package:ementin_flutter/data/repository/auth_repository.dart';
import 'package:ementin_flutter/data/repository/author_repository.dart';
import 'package:ementin_flutter/data/repository/event_repository.dart';
import 'package:ementin_flutter/data/repository/insta_repository.dart';
import 'package:ementin_flutter/data/repository/program_repository.dart';
import 'package:ementin_flutter/data/api/shared_preference_helper.dart';
import 'package:ementin_flutter/providers/auth_provider.dart';
import 'package:ementin_flutter/providers/event_provider.dart';
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
