import 'dart:async';

import 'package:eventapp/exceptions/async_error_logger.dart';
import 'package:eventapp/exceptions/error_logger.dart';
import 'package:eventapp/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  late ErrorLogger errorLogger;

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // * Create ProviderContainer with any required overrides
    final container = ProviderContainer(
      overrides: [],
      observers: [AsyncErrorLogger()],
    );

    errorLogger = container.read(errorLoggerProvider);

    // * Entry point of the app
    runApp(UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ));

    // * This code will present some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };

    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('An error occurred'),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }, (Object error, StackTrace stack) {
    errorLogger.logError(error, stack);
  });
}
