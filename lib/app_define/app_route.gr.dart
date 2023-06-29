// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;

import '../features/event/pages/event_list_page.dart' as _i2;
import '../features/event_home/pages/event_main_page.dart' as _i3;
import '../features/event_speaker_details_page.dart' as _i15;
import '../features/event_speakers_page.dart' as _i6;
import '../features/main/event_gallery_page.dart' as _i9;
import '../features/main/event_info_page.dart' as _i13;
import '../features/main/event_sponsors_page.dart' as _i12;
import '../features/program/domain/author_model.dart' as _i19;
import '../features/program/domain/program_item_model.dart' as _i18;
import '../features/program/pages/event_program_page.dart' as _i4;
import '../features/program/widgets/program_item_hero.dart' as _i14;
import '../features/startup/screens/app_startup_screen.dart' as _i1;
import '../pages/auth/auth_page.dart' as _i10;
import '../pages/checkin_page.dart' as _i11;
import '../pages/favourites_page.dart' as _i5;
import '../pages/profile_page.dart' as _i8;
import '../pages/registration_details_page.dart' as _i7;

class AppRouter extends _i16.RootStackRouter {
  AppRouter([_i17.GlobalKey<_i17.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    AppStartupScreen.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AppStartupScreen(),
      );
    },
    EventListRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EventListPage(),
      );
    },
    EventHomeRoute.name: (routeData) {
      final args = routeData.argsAs<EventHomeRouteArgs>(
          orElse: () => const EventHomeRouteArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.EventHomePage(key: args.key),
      );
    },
    EventProgramRoute.name: (routeData) {
      final args = routeData.argsAs<EventProgramRouteArgs>(
          orElse: () => const EventProgramRouteArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.EventProgramPage(
          key: args.key,
          selectedProgramItem: args.selectedProgramItem,
        ),
      );
    },
    FavouritesRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.FavouritesPage(),
      );
    },
    EventSpeakersRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EventSpeakersPage(),
      );
    },
    RegistrationDetailsRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.RegistrationDetailsPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ProfilePage(),
      );
    },
    GalleryRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.GalleryPage(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.AuthPage(),
      );
    },
    CheckInRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.CheckInPage(),
      );
    },
    SponsorsRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.SponsorsPage(),
      );
    },
    EventInfoRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.EventInfoPage(),
      );
    },
    ProgramItemFullHero.name: (routeData) {
      final args = routeData.argsAs<ProgramItemFullHeroArgs>();
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.ProgramItemFullHero(
          key: args.key,
          presentation: args.presentation,
          onTap: args.onTap,
          showBody: args.showBody,
          showLoveButton: args.showLoveButton,
        ),
      );
    },
    EventSpeakerDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<EventSpeakerDetailsRouteArgs>();
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.EventSpeakerDetailsPage(
          key: args.key,
          speaker: args.speaker,
        ),
      );
    },
  };

  @override
  List<_i16.RouteConfig> get routes => [
        _i16.RouteConfig(
          AppStartupScreen.name,
          path: '/',
        ),
        _i16.RouteConfig(
          EventListRoute.name,
          path: '/events',
        ),
        _i16.RouteConfig(
          EventHomeRoute.name,
          path: '/event-home',
          children: [
            _i16.RouteConfig(
              EventProgramRoute.name,
              path: 'program',
              parent: EventHomeRoute.name,
              children: [
                _i16.RouteConfig(
                  EventInfoRoute.name,
                  path: 'info',
                  parent: EventProgramRoute.name,
                ),
                _i16.RouteConfig(
                  ProgramItemFullHero.name,
                  path: 'program-details',
                  parent: EventProgramRoute.name,
                ),
              ],
            ),
            _i16.RouteConfig(
              FavouritesRoute.name,
              path: 'favourtes',
              parent: EventHomeRoute.name,
            ),
            _i16.RouteConfig(
              EventSpeakersRoute.name,
              path: 'speakers',
              parent: EventHomeRoute.name,
              children: [
                _i16.RouteConfig(
                  EventSpeakerDetailsRoute.name,
                  path: 'speaker-details',
                  parent: EventSpeakersRoute.name,
                )
              ],
            ),
            _i16.RouteConfig(
              RegistrationDetailsRoute.name,
              path: 'registration-details',
              parent: EventHomeRoute.name,
            ),
            _i16.RouteConfig(
              ProfileRoute.name,
              path: 'profile',
              parent: EventHomeRoute.name,
            ),
            _i16.RouteConfig(
              GalleryRoute.name,
              path: 'gallery',
              parent: EventHomeRoute.name,
            ),
            _i16.RouteConfig(
              AuthRoute.name,
              path: 'auth',
              parent: EventHomeRoute.name,
            ),
            _i16.RouteConfig(
              CheckInRoute.name,
              path: 'check-in',
              parent: EventHomeRoute.name,
            ),
            _i16.RouteConfig(
              SponsorsRoute.name,
              path: 'sponsors',
              parent: EventHomeRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.AppStartupScreen]
class AppStartupScreen extends _i16.PageRouteInfo<void> {
  const AppStartupScreen()
      : super(
          AppStartupScreen.name,
          path: '/',
        );

  static const String name = 'AppStartupScreen';
}

/// generated route for
/// [_i2.EventListPage]
class EventListRoute extends _i16.PageRouteInfo<void> {
  const EventListRoute()
      : super(
          EventListRoute.name,
          path: '/events',
        );

  static const String name = 'EventListRoute';
}

/// generated route for
/// [_i3.EventHomePage]
class EventHomeRoute extends _i16.PageRouteInfo<EventHomeRouteArgs> {
  EventHomeRoute({
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          EventHomeRoute.name,
          path: '/event-home',
          args: EventHomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'EventHomeRoute';
}

class EventHomeRouteArgs {
  const EventHomeRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'EventHomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.EventProgramPage]
class EventProgramRoute extends _i16.PageRouteInfo<EventProgramRouteArgs> {
  EventProgramRoute({
    _i17.Key? key,
    _i18.ProgramItemModel? selectedProgramItem,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          EventProgramRoute.name,
          path: 'program',
          args: EventProgramRouteArgs(
            key: key,
            selectedProgramItem: selectedProgramItem,
          ),
          initialChildren: children,
        );

  static const String name = 'EventProgramRoute';
}

class EventProgramRouteArgs {
  const EventProgramRouteArgs({
    this.key,
    this.selectedProgramItem,
  });

  final _i17.Key? key;

  final _i18.ProgramItemModel? selectedProgramItem;

  @override
  String toString() {
    return 'EventProgramRouteArgs{key: $key, selectedProgramItem: $selectedProgramItem}';
  }
}

/// generated route for
/// [_i5.FavouritesPage]
class FavouritesRoute extends _i16.PageRouteInfo<void> {
  const FavouritesRoute()
      : super(
          FavouritesRoute.name,
          path: 'favourtes',
        );

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i6.EventSpeakersPage]
class EventSpeakersRoute extends _i16.PageRouteInfo<void> {
  const EventSpeakersRoute({List<_i16.PageRouteInfo>? children})
      : super(
          EventSpeakersRoute.name,
          path: 'speakers',
          initialChildren: children,
        );

  static const String name = 'EventSpeakersRoute';
}

/// generated route for
/// [_i7.RegistrationDetailsPage]
class RegistrationDetailsRoute extends _i16.PageRouteInfo<void> {
  const RegistrationDetailsRoute()
      : super(
          RegistrationDetailsRoute.name,
          path: 'registration-details',
        );

  static const String name = 'RegistrationDetailsRoute';
}

/// generated route for
/// [_i8.ProfilePage]
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i9.GalleryPage]
class GalleryRoute extends _i16.PageRouteInfo<void> {
  const GalleryRoute()
      : super(
          GalleryRoute.name,
          path: 'gallery',
        );

  static const String name = 'GalleryRoute';
}

/// generated route for
/// [_i10.AuthPage]
class AuthRoute extends _i16.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: 'auth',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i11.CheckInPage]
class CheckInRoute extends _i16.PageRouteInfo<void> {
  const CheckInRoute()
      : super(
          CheckInRoute.name,
          path: 'check-in',
        );

  static const String name = 'CheckInRoute';
}

/// generated route for
/// [_i12.SponsorsPage]
class SponsorsRoute extends _i16.PageRouteInfo<void> {
  const SponsorsRoute()
      : super(
          SponsorsRoute.name,
          path: 'sponsors',
        );

  static const String name = 'SponsorsRoute';
}

/// generated route for
/// [_i13.EventInfoPage]
class EventInfoRoute extends _i16.PageRouteInfo<void> {
  const EventInfoRoute()
      : super(
          EventInfoRoute.name,
          path: 'info',
        );

  static const String name = 'EventInfoRoute';
}

/// generated route for
/// [_i14.ProgramItemFullHero]
class ProgramItemFullHero extends _i16.PageRouteInfo<ProgramItemFullHeroArgs> {
  ProgramItemFullHero({
    _i17.Key? key,
    required _i18.ProgramItemModel presentation,
    required void Function() onTap,
    required bool showBody,
    required bool showLoveButton,
  }) : super(
          ProgramItemFullHero.name,
          path: 'program-details',
          args: ProgramItemFullHeroArgs(
            key: key,
            presentation: presentation,
            onTap: onTap,
            showBody: showBody,
            showLoveButton: showLoveButton,
          ),
        );

  static const String name = 'ProgramItemFullHero';
}

class ProgramItemFullHeroArgs {
  const ProgramItemFullHeroArgs({
    this.key,
    required this.presentation,
    required this.onTap,
    required this.showBody,
    required this.showLoveButton,
  });

  final _i17.Key? key;

  final _i18.ProgramItemModel presentation;

  final void Function() onTap;

  final bool showBody;

  final bool showLoveButton;

  @override
  String toString() {
    return 'ProgramItemFullHeroArgs{key: $key, presentation: $presentation, onTap: $onTap, showBody: $showBody, showLoveButton: $showLoveButton}';
  }
}

/// generated route for
/// [_i15.EventSpeakerDetailsPage]
class EventSpeakerDetailsRoute
    extends _i16.PageRouteInfo<EventSpeakerDetailsRouteArgs> {
  EventSpeakerDetailsRoute({
    _i17.Key? key,
    required _i19.AuthorModel speaker,
  }) : super(
          EventSpeakerDetailsRoute.name,
          path: 'speaker-details',
          args: EventSpeakerDetailsRouteArgs(
            key: key,
            speaker: speaker,
          ),
        );

  static const String name = 'EventSpeakerDetailsRoute';
}

class EventSpeakerDetailsRouteArgs {
  const EventSpeakerDetailsRouteArgs({
    this.key,
    required this.speaker,
  });

  final _i17.Key? key;

  final _i19.AuthorModel speaker;

  @override
  String toString() {
    return 'EventSpeakerDetailsRouteArgs{key: $key, speaker: $speaker}';
  }
}
