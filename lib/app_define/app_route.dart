import 'package:auto_route/auto_route.dart';
import 'package:eventapp/features/event_program_page.dart';
import 'package:eventapp/features/event_speaker_details_page.dart';
import 'package:eventapp/features/event_speakers_page.dart';
import 'package:eventapp/features/main/event_gallery_page.dart';
import 'package:eventapp/features/main/event_info_page.dart';
import 'package:eventapp/features/main/event_sponsors_page.dart';
import 'package:eventapp/features/program/pages/program_list_page.dart';
import 'package:eventapp/features/startup/screens/app_startup_screen.dart';
import 'package:eventapp/pages/auth/auth_page.dart';
import 'package:eventapp/pages/checkin_page.dart';
import 'package:eventapp/pages/favourites_page.dart';
import 'package:eventapp/features/event_home/pages/event_main_page.dart';
import 'package:eventapp/pages/profile_page.dart';
import 'package:eventapp/pages/registration_details_page.dart';
import '../features/event/pages/event_list_page.dart';
import '../features/program/widgets/program_item_hero.dart';

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
          path: 'event',
          page: EventProgramPage,
          children: [
            AutoRoute(
              path: 'info',
              page: EventInfoPage,
            ),
            AutoRoute(
              path: 'program',
              page: ProgramListPage,
            ),
            AutoRoute(
              path: 'program-details',
              page: ProgramItemFullHero,
            ),
          ],
        ),
        AutoRoute(
          path: 'favourtes',
          page: FavouritesPage,
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
