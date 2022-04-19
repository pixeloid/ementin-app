import 'package:eventapp/data/api/request/program_request.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/providers/locale_provider.dart';
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

import 'app_define/app_route.gr.dart';
import 'data/api/request/event_request.dart';
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

  @override
  Widget build(BuildContext context) {
    final LocaleProvider localeProvider = context.watch<LocaleProvider>();
    final AppTheme appTheme = context.theme();

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () => MaterialApp.router(
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
        theme: appTheme.buildThemeData(),
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

//  String? userToken = await Credential.singleton.getToken();

  runApp(MultiProvider(providers: <SingleChildWidget>[
    Provider<EventRequest>(
      create: (_) => EventRequest(),
    ),
    ChangeNotifierProvider<EventProvider>(
      create: (BuildContext context) => EventProvider(
        context.read<EventRequest>(),
      ),
    ),
    ChangeNotifierProvider<AppThemeProvider>(
      create: (_) => AppThemeProvider(),
    ),
    ChangeNotifierProvider<AuthProvider>(
      create: (_) => AuthProvider(),
    ),
    ChangeNotifierProvider<LocaleProvider>(
      create: (_) => LocaleProvider(),
    ),
    Provider<ProgramRequest>(
      create: (_) => ProgramRequest(),
    ),
    ChangeNotifierProvider<ProgramProvider>(
      create: (BuildContext context) => ProgramProvider(
        context.read<ProgramRequest>(),
      ),
    ),
  ], child: const MyApp()));
}
