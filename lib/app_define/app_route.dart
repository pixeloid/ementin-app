import 'package:auto_route/auto_route.dart';
import 'package:eventapp/pages/auth/auth_page.dart';
import 'package:eventapp/pages/checkin_page.dart';
import 'package:eventapp/pages/event/main/event_gallery_page.dart';
import 'package:eventapp/pages/event/main/presentation_details_page.dart';
import 'package:eventapp/pages/favourites_page.dart';
import 'package:eventapp/pages/main/main_page.dart';
import 'package:eventapp/pages/profile_page.dart';
import 'package:eventapp/pages/registration_details_page.dart';

import '../pages/event/event_program_page.dart';
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
            name: 'ProgramRouter',
            page: EventProgramPage,
            children: [
              AutoRoute(
                path: 'presentation-details/:programItemId',
                page: PresentationDetailsPage,
              ),
              RedirectRoute(path: '*', redirectTo: ''),
            ]),
        AutoRoute(
          path: 'favourtes',
          page: FavouritesPage,
        ),
        AutoRoute(
          path: 'registration-details',
          page: RegistrationDetailsPage,
        ),
        AutoRoute(
          path: 'profile',
          page: ProfilePage,
        ),
        AutoRoute(
          path: 'gallery',
          page: GalleryPage,
        ),
        AutoRoute(
          path: 'auth',
          page: AuthPage,
        ),
        AutoRoute(
          path: 'check-in',
          page: CheckInPage,
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
