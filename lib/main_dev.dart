import 'package:eventapp/environments/environement.dart';
import 'package:eventapp/app_define/app_config.dart';

import 'my_app.dart';

Future<void> main() async {
  AppConfig(env: Environment.development());
  await myMain();
}
