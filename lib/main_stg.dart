import 'package:ementin_flutter/environments/environement.dart';
import 'package:ementin_flutter/app_define/app_config.dart';

import 'my_app.dart';

Future<void> main() async {
  AppConfig(env: Environment.staging());

  await myMain();
}
