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

import '../models/author_model.dart' as _i19;
import '../models/program_item_model.dart' as _i18;
import '../pages/auth/auth_page.dart' as _i9;
import '../pages/checkin_page.dart' as _i10;
import '../pages/event/event_program_page.dart' as _i3;
import '../pages/event/event_speaker_details_page.dart' as _i15;
import '../pages/event/event_speakers_page.dart' as _i5;
import '../pages/event/main/event_gallery_page.dart' as _i8;
import '../pages/event/main/event_info_page.dart' as _i12;
import '../pages/event/main/event_sponsors_page.dart' as _i11;
import '../pages/event/main/program_list_page.dart' as _i13;
import '../pages/event/main/widgets/program_item_hero.dart' as _i14;
import '../pages/event_list_page.dart' as _i1;
import '../pages/favourites_page.dart' as _i4;
import '../pages/main/main_page.dart' as _i2;
import '../pages/profile_page.dart' as _i7;
import '../pages/registration_details_page.dart' as _i6;

class AppRouter extends _i16.RootStackRouter {
  AppRouter([_i17.GlobalKey<_i17.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    EventListRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EventListPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MainPage(),
      );
    },
    EventProgramRoute.name: (routeData) {
      final args = routeData.argsAs<EventProgramRouteArgs>(
          orElse: () => const EventProgramRouteArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.EventProgramPage(
          key: args.key,
          selectedProgramItem: args.selectedProgramItem,
        ),
      );
    },
    FavouritesRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.FavouritesPage(),
      );
    },
    EventSpeakersRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.EventSpeakersPage(),
      );
    },
    RegistrationDetailsRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.RegistrationDetailsPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ProfilePage(),
      );
    },
    GalleryRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.GalleryPage(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.AuthPage(),
      );
    },
    CheckInRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.CheckInPage(),
      );
    },
    SponsorsRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.SponsorsPage(),
      );
    },
    EventInfoRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.EventInfoPage(),
      );
    },
    ProgramListRoute.name: (routeData) {
      final args = routeData.argsAs<ProgramListRouteArgs>();
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.ProgramListPage(
          args.programData,
          key: args.key,
        ),
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
          '/#redirect',
          path: '/',
          redirectTo: '/events',
          fullMatch: true,
        ),
        _i16.RouteConfig(
          EventListRoute.name,
          path: '/events',
        ),
        _i16.RouteConfig(
          MainRoute.name,
          path: '/main',
          children: [
            _i16.RouteConfig(
              EventProgramRoute.name,
              path: 'event',
              parent: MainRoute.name,
              children: [
                _i16.RouteConfig(
                  EventInfoRoute.name,
                  path: 'info',
                  parent: EventProgramRoute.name,
                ),
                _i16.RouteConfig(
                  ProgramListRoute.name,
                  path: 'program',
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
              parent: MainRoute.name,
            ),
            _i16.RouteConfig(
              EventSpeakersRoute.name,
              path: 'speakers',
              parent: MainRoute.name,
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
              parent: MainRoute.name,
            ),
            _i16.RouteConfig(
              ProfileRoute.name,
              path: 'profile',
              parent: MainRoute.name,
            ),
            _i16.RouteConfig(
              GalleryRoute.name,
              path: 'gallery',
              parent: MainRoute.name,
            ),
            _i16.RouteConfig(
              AuthRoute.name,
              path: 'auth',
              parent: MainRoute.name,
            ),
            _i16.RouteConfig(
              CheckInRoute.name,
              path: 'check-in',
              parent: MainRoute.name,
            ),
            _i16.RouteConfig(
              SponsorsRoute.name,
              path: 'sponsors',
              parent: MainRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.EventListPage]
class EventListRoute extends _i16.PageRouteInfo<void> {
  const EventListRoute()
      : super(
          EventListRoute.name,
          path: '/events',
        );

  static const String name = 'EventListRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i16.PageRouteInfo<void> {
  const MainRoute({List<_i16.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/main',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.EventProgramPage]
class EventProgramRoute extends _i16.PageRouteInfo<EventProgramRouteArgs> {
  EventProgramRoute({
    _i17.Key? key,
    _i18.ProgramItemModel? selectedProgramItem,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          EventProgramRoute.name,
          path: 'event',
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
/// [_i4.FavouritesPage]
class FavouritesRoute extends _i16.PageRouteInfo<void> {
  const FavouritesRoute()
      : super(
          FavouritesRoute.name,
          path: 'favourtes',
        );

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i5.EventSpeakersPage]
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
/// [_i6.RegistrationDetailsPage]
class RegistrationDetailsRoute extends _i16.PageRouteInfo<void> {
  const RegistrationDetailsRoute()
      : super(
          RegistrationDetailsRoute.name,
          path: 'registration-details',
        );

  static const String name = 'RegistrationDetailsRoute';
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i8.GalleryPage]
class GalleryRoute extends _i16.PageRouteInfo<void> {
  const GalleryRoute()
      : super(
          GalleryRoute.name,
          path: 'gallery',
        );

  static const String name = 'GalleryRoute';
}

/// generated route for
/// [_i9.AuthPage]
class AuthRoute extends _i16.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: 'auth',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i10.CheckInPage]
class CheckInRoute extends _i16.PageRouteInfo<void> {
  const CheckInRoute()
      : super(
          CheckInRoute.name,
          path: 'check-in',
        );

  static const String name = 'CheckInRoute';
}

/// generated route for
/// [_i11.SponsorsPage]
class SponsorsRoute extends _i16.PageRouteInfo<void> {
  const SponsorsRoute()
      : super(
          SponsorsRoute.name,
          path: 'sponsors',
        );

  static const String name = 'SponsorsRoute';
}

/// generated route for
/// [_i12.EventInfoPage]
class EventInfoRoute extends _i16.PageRouteInfo<void> {
  const EventInfoRoute()
      : super(
          EventInfoRoute.name,
          path: 'info',
        );

  static const String name = 'EventInfoRoute';
}

/// generated route for
/// [_i13.ProgramListPage]
class ProgramListRoute extends _i16.PageRouteInfo<ProgramListRouteArgs> {
  ProgramListRoute({
    required List<_i18.ProgramItemModel> programData,
    _i17.Key? key,
  }) : super(
          ProgramListRoute.name,
          path: 'program',
          args: ProgramListRouteArgs(
            programData: programData,
            key: key,
          ),
        );

  static const String name = 'ProgramListRoute';
}

class ProgramListRouteArgs {
  const ProgramListRouteArgs({
    required this.programData,
    this.key,
  });

  final List<_i18.ProgramItemModel> programData;

  final _i17.Key? key;

  @override
  String toString() {
    return 'ProgramListRouteArgs{programData: $programData, key: $key}';
  }
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
