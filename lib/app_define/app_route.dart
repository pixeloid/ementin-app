import 'package:auto_route/auto_route.dart';
import 'package:ementin_flutter/app_define/app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      initial: true,
      path: '/events',
      page: EventListRoute.page,
    ),

    AutoRoute(
      path: '/main',
      page: MainRoute.page,
      children: [
        AutoRoute(
          path: 'event',
          page: EventProgramRoute.page,
          children: [
            AutoRoute(
              path: 'info',
              page: EventInfoRoute.page,
            ),
            AutoRoute(
              path: 'program',
              page: ScheduleEventList.page,
            ),
            AutoRoute(
              path: 'program-details',
              page: ProgramItemFullHeroRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: 'favourtes',
          page: FavouritesRoute.page,
        ),
        AutoRoute(
          path: 'speakers',
          page: EventSpeakersRoute.page,
          children: [
            AutoRoute(
              path: 'speaker-details',
              page: EventSpeakerDetailsRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: 'registration-details',
          page: RegistrationDetailsRoute.page,
        ),
        AutoRoute(
          path: 'profile',
          page: ProfileRoute.page,
        ),
        AutoRoute(
          path: 'gallery',
          page: GalleryRoute.page,
        ),
        AutoRoute(
          path: 'auth',
          page: AuthRoute.page,
        ),
        AutoRoute(
          path: 'check-in',
          page: CheckInRoute.page,
        ),
        AutoRoute(
          path: 'sponsors',
          page: SponsorsRoute.page,
        ),
      ],
    ),

    //  AutoRoute(
    //    path: 'settings',
    //    name: 'SettingsRouter',
    //    page: SettingsPage,
    //  )
  ];
}
