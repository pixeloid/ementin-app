import 'package:ementin_flutter/environments/environement.dart';
import 'package:ementin_flutter/app_define/app_config.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'my_app.dart';

Future<void> main() async {
  AppConfig(env: Environment.production());
  await SentryFlutter.init((options) {
    options.dsn =
        'https://db7b1ef7a1414f4589589cce81bc3685@o4505170978537472.ingest.sentry.io/4505170990727168';
    // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
    // We recommend adjusting this value in production.
    options.tracesSampleRate = 1.0;
  }, appRunner: () => myMain());
}
