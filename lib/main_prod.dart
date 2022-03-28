// @dart=2.9
import 'package:eventapp/environments/environement.dart';
import 'package:eventapp/main.dart' as app;
import 'package:eventapp/app_define/app_config.dart';

Future<void> main() async {
  AppConfig(env: Environment.production());
  await app.main();
}
