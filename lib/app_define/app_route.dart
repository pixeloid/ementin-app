// ignore_for_file: unused_import

import 'package:auto_route/auto_route.dart';
import 'package:eventapp/features/program/pages/event_program_page.dart';
import 'package:eventapp/features/main/event_gallery_page.dart';
import 'package:eventapp/features/main/event_info_page.dart';
import 'package:eventapp/features/main/event_sponsors_page.dart';
import 'package:eventapp/features/program/widgets/program_list.dart';
import 'package:eventapp/features/startup/screens/app_startup_screen.dart';
import 'package:eventapp/pages/auth/auth_page.dart';
import 'package:eventapp/pages/checkin_page.dart';
import 'package:eventapp/pages/favourites_page.dart';
import 'package:eventapp/features/event_home/pages/event_main_page.dart';
import 'package:eventapp/pages/profile_page.dart';
import 'package:eventapp/pages/registration_details_page.dart';
import '../features/author/presentation/event_speaker_details_page.dart';
import '../features/author/presentation/event_speakers_page.dart';
import '../features/event/pages/event_list_page.dart';
import '../features/program/widgets/program_item_details.dart';
import '../features/program/widgets/program_item_hero.dart';
import '../features/user/presentation/checked_in_users_list_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      path: '/',
      page: AppStartupScreen,
    ),

    AutoRoute(
      path: '/events',
      page: EventListPage,
    ),

    AutoRoute(
      path: '/event-home',
      page: EventHomePage,
      children: [
        AutoRoute(
          path: 'program',
          page: EventProgramPage,
          children: [
            AutoRoute(
              path: 'info',
              page: EventInfoPage,
            ),
            AutoRoute(
              path: 'program-details',
              page: ProgramItemDetails,
            ),
          ],
        ),
        AutoRoute(
          path: 'favourtes',
          page: FavouritesPage,
        ),
        AutoRoute(
          path: 'checked-in-users',
          page: CheckedInUsersListPage,
        ),
        AutoRoute(
          path: 'speakers',
          page: EventSpeakersPage,
          children: [
            AutoRoute(
              path: 'speaker-details',
              page: EventSpeakerDetailsPage,
            ),
          ],
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
        AutoRoute(
          path: 'sponsors',
          page: SponsorsPage,
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
