import 'package:eventapp/app_define/app_route.dart';
import 'package:eventapp/data/repository/auth_repository.dart';
import 'package:eventapp/data/repository/poll_repository.dart';
import 'package:eventapp/data/repository/program_repository.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/providers/locale_provider.dart';
import 'package:eventapp/providers/poll_provider.dart';
import 'package:eventapp/services/locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eventapp/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:eventapp/app_define/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'data/repository/event_repository.dart';
import 'providers/program_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  final _appRouter = AppRouter();

  Future<void> initOneSignal(BuildContext context) async {
    /// Set App Id.
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize('37356181-bc89-4053-9944-446bdf13d90a');
    OneSignal.Notifications.requestPermission(true);

    /// Get the Onesignal userId and update that into the firebase.
    /// So, that it can be used to send Notifications to users later.̥
    OneSignal.User.pushSubscription.addObserver((state) {
      debugPrint(state.current.jsonRepresentation());
    });

    OneSignal.Notifications.addPermissionObserver((state) {
      debugPrint("Has permission $state");
    });

    OneSignal.Notifications.addClickListener((event) {
      debugPrint('NOTIFICATION CLICK LISTENER CALLED WITH EVENT: $event');
    });
    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      /// preventDefault to not display the notification
      event.preventDefault();

      /// Do async work

      /// notification.display() to display after preventing default
      event.notification.display();
    });
//
    /// Calls when foreground notification arrives.
    // OneSignal.shared.setNotificationWillShowInForegroundHandler(
    //   handleForegroundNotifications,
    // );

    // /// Calls when the notification opens the app.
    // OneSignal.shared.setNotificationOpenedHandler(handleBackgroundNotification);
  }

  @override
  Widget build(BuildContext context) {
    initOneSignal(context);

    final LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (BuildContext context, child) => MaterialApp.router(
        routerConfig: _appRouter.config(),
        locale: localeProvider.locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.fromType(ThemeType.ementin).themeData,
      ),
    );
  }
}

Future<void> myMain() async {
  /// Start services later
  WidgetsFlutterBinding.ensureInitialized();

  /// Force status bar mode
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
      .copyWith(statusBarIconBrightness: Brightness.dark));

  /// Force portrait mode
  await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp]);

  /// We're using HiveStore for persistence,
  /// so we need to initialize Hive.
  await initHiveForFlutter();

  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  runApp(MultiProvider(providers: <SingleChildWidget>[
    Provider<EventRepository>(
      create: (_) => EventRepository(),
    ),
    Provider<AuthRepository>(
      create: (_) => AuthRepository(),
    ),
    Provider<ProgramRepository>(
      create: (_) => ProgramRepository(),
    ),
    Provider<PollRepository>(
      create: (_) => PollRepository(),
    ),
    ChangeNotifierProvider<EventProvider>(
      create: (BuildContext context) => EventProvider(
        context.read<EventRepository>(),
      ),
    ),
    ChangeNotifierProvider<AppThemeProvider>(
      create: (_) => AppThemeProvider(),
    ),
    ChangeNotifierProxyProvider<EventProvider, PollProvider>(
      update: (context, eventProvider, previousPollProvider) =>
          PollProvider(context.read<PollRepository>(), eventProvider),
      create: (BuildContext context) =>
          PollProvider(context.read<PollRepository>(), null),
    ),
    ChangeNotifierProvider<AuthProvider>(
      create: (BuildContext context) => AuthProvider(
        context.read<AuthRepository>(),
      ),
    ),
    ChangeNotifierProvider<LocaleProvider>(
      create: (_) => LocaleProvider(),
    ),
    ChangeNotifierProvider<ProgramProvider>(
      create: (BuildContext context) => ProgramProvider(),
    ),
  ], child: const MyApp()));
}
