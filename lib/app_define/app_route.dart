import 'package:auto_route/auto_route.dart';
import 'package:eventapp/pages/auth/p_auth.dart';
import 'package:eventapp/pages/p_event.dart';

import '../pages/p_home.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      page: PHome,
    ),
    AutoRoute(
      page: AuthScreen,
    ),
    AutoRoute(
      page: PEvent,
      children: [],
    ),
    //  AutoRoute(
    //    path: 'settings',
    //    name: 'SettingsRouter',
    //    page: SettingsPage,
    //  )
    //]),
  ],
)
class $AppRouter {}
