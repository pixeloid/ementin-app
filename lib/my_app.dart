import 'package:eventapp/providers/locale_provider.dart';
import 'package:eventapp/services/locator.dart';
import 'package:eventapp/utils/riverpod_logger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:eventapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:eventapp/app_define/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'app_define/app_route.gr.dart';
import 'features/auth/presentation/auth_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

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
    // await OneSignal.shared.promptUserForPushNotificationPermission(
    //   fallbackToSettings: true,
    // );
//
    /// Calls when foreground notification arrives.
    // OneSignal.shared.setNotificationWillShowInForegroundHandler(
    //   handleForegroundNotifications,
    // );

    // /// Calls when the notification opens the app.
    // OneSignal.shared.setNotificationOpenedHandler(handleBackgroundNotification);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    initOneSignal(context);
    final appRouter = AppRouter();

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (BuildContext context, child) => MaterialApp.router(
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
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

  await setup();

  runApp(
    ProviderScope(
      observers: [RiverpodLogger()],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (BuildContext context, child) => const MaterialApp(
          home: TestWidget(),
        ),
      ),
    ),
  );
}

class TestWidget extends HookConsumerWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authNotifierProvider.notifier);
    useEffect(() {
      Future.microtask(() async {
        authController.initAction();
      });
      return;
    }, const []);

    final provider = ref.watch(authNotifierProvider);

    return Column(
      children: [
        Text(provider.isLoggedIn.toString()),
        if (!provider.isBusy)
          ElevatedButton(
            onPressed: () => provider.isLoggedIn
                ? authController.logout()
                : authController.login(),
            child: Text(provider.isLoggedIn ? 'LOGOUT' : 'login'),
          ),
      ],
    );
  }
}
