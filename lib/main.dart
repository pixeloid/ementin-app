import 'package:eventapp/my_app.dart';

import 'app_define/app_config.dart';
import 'environments/environement.dart';

Future<void> main() async {
  AppConfig(env: Environment.production());

  await myMain();
}
