// ignore_for_file: unused_import

import 'package:eventapp/data/api/dio_client.dart';
import 'package:eventapp/data/repository/auth_repository.dart';
import 'package:eventapp/features/author/infrastructure/author_repository.dart';
import 'package:eventapp/features/event/infrastructure/event_repository.dart';
import 'package:eventapp/data/repository/insta_repository.dart';
import 'package:eventapp/features/program/infrastructure/program_repository.dart';
import 'package:eventapp/data/api/shared_preference_helper.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
//
Future<void> setup() async {
  //getIt.registerSingleton<InstaRepository>(InstaRepository());
  //getIt.registerSingleton<ProgramRepository>(ProgramRepository());
  //getIt.registerSingleton<AuthorRepository>(AuthorRepository());
}
