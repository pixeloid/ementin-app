import 'package:auto_route/auto_route.dart';
import 'package:eventapp/pages/auth/p_auth.dart';
import 'package:eventapp/pages/event/main/p_event_info.dart';

import '../pages/event/main/p_event_program.dart';
import '../pages/event/p_event_main.dart';
import '../pages/p_event_list.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/home',
      page: PEventList,
    ),
    AutoRoute(
      path: '/auth',
      page: AuthScreen,
    ),
    AutoRoute(
      path: '/event',
      page: PEventMain,
      children: [
        AutoRoute(
          path: 'info',
          page: PEventInfo,
        ),
        AutoRoute(
          path: 'program',
          page: PEventProgram,
        ),
      ],
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
