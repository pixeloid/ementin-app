import 'package:eventapp/data/api/repository/auth_repository.dart';
import 'package:eventapp/data/api/repository/poll_repository.dart';
import 'package:eventapp/data/api/repository/program_repository.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/providers/locale_provider.dart';
import 'package:eventapp/providers/poll_provider.dart';
import 'package:eventapp/services/locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:eventapp/generated/l10n.dart';
import 'package:eventapp/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:eventapp/app_define/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'app_define/app_route.gr.dart';
import 'data/api/repository/event_repository.dart';
import 'providers/program_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  final _appRouter = AppRouter();

  Future<void> initOneSignal(BuildContext context) async {
    /// Set App Id.
    await OneSignal.shared.setAppId('37356181-bc89-4053-9944-446bdf13d90a');

    /// Get the Onesignal userId and update that into the firebase.
    /// So, that it can be used to send Notifications to users later.̥
    final status = await OneSignal.shared.getDeviceState();
    final String? osUserID = status?.userId;
    // ignore: avoid_print
    print('Player ID: $osUserID');
    // We will update this once he logged in and goes to dashboard.
    ////updateUserProfile(osUserID);
    // Store it into shared prefs, So that later we can use it.
    //Preferences.setOnesignalUserId(osUserID);

    // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    await OneSignal.shared.promptUserForPushNotificationPermission(
      fallbackToSettings: true,
    );

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

    final LocaleProvider localeProvider = context.watch<LocaleProvider>();

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (BuildContext context, child) => MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        locale: localeProvider.locale,
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
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
      create: (BuildContext context) => ProgramProvider(
        context.read<ProgramRepository>(),
      ),
    ),
  ], child: const MyApp()));
}
