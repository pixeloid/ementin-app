import 'package:auto_route/auto_route.dart';
import 'package:eventapp/pages/auth/auth_page.dart';
import 'package:eventapp/pages/checkin_page.dart';
import 'package:eventapp/pages/event/main/event_info_page.dart';
import 'package:eventapp/pages/favourites_page.dart';
import 'package:eventapp/pages/main/main_page.dart';
import 'package:eventapp/pages/profile_page.dart';

import '../pages/event/main/event_program_page.dart';
import '../pages/event/event_main_page.dart';
import '../pages/event_list_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      path: '/events',
      page: EventListPage,
    ),

    AutoRoute(
      path: '/main',
      page: MainPage,
      children: [
        AutoRoute(
          path: 'event',
          page: EventMainPage,
          children: [
            AutoRoute(
              path: 'info',
              page: EventInfoPage,
            ),
            AutoRoute(
              path: 'program',
              page: EventProgramPage,
            ),
          ],
        ),
        AutoRoute(
          path: 'favourtes',
          page: FavouritesPage,
        ),
        AutoRoute(
          path: 'profile',
          page: ProfilePage,
        ),
        AutoRoute(
          path: 'check-in',
          page: CheckInPage,
        ),
        AutoRoute(
          path: 'auth',
          page: AuthPage,
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
