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
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;

import '../features/author/domain/author_model.dart' as _i20;
import '../features/author/presentation/event_speaker_details_page.dart'
    as _i16;
import '../features/author/presentation/event_speakers_page.dart' as _i7;
import '../features/event/pages/event_list_page.dart' as _i2;
import '../features/event_home/pages/event_main_page.dart' as _i3;
import '../features/main/event_gallery_page.dart' as _i10;
import '../features/main/event_info_page.dart' as _i14;
import '../features/main/event_sponsors_page.dart' as _i13;
import '../features/program/domain/program_item_model.dart' as _i19;
import '../features/program/pages/event_program_page.dart' as _i4;
import '../features/program/widgets/program_item_details.dart' as _i15;
import '../features/startup/screens/app_startup_screen.dart' as _i1;
import '../features/user/presentation/checked_in_users_list_page.dart' as _i6;
import '../pages/auth/auth_page.dart' as _i11;
import '../pages/checkin_page.dart' as _i12;
import '../pages/favourites_page.dart' as _i5;
import '../pages/profile_page.dart' as _i9;
import '../pages/registration_details_page.dart' as _i8;

class AppRouter extends _i17.RootStackRouter {
  AppRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    AppStartupScreen.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AppStartupScreen(),
      );
    },
    EventListRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EventListPage(),
      );
    },
    EventHomeRoute.name: (routeData) {
      final args = routeData.argsAs<EventHomeRouteArgs>(
          orElse: () => const EventHomeRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.EventHomePage(key: args.key),
      );
    },
    EventProgramRoute.name: (routeData) {
      final args = routeData.argsAs<EventProgramRouteArgs>(
          orElse: () => const EventProgramRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.EventProgramPage(
          key: args.key,
          selectedProgramItem: args.selectedProgramItem,
        ),
      );
    },
    FavouritesRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.FavouritesPage(),
      );
    },
    CheckedInUsersListRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.CheckedInUsersListPage(),
      );
    },
    EventSpeakersRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.EventSpeakersPage(),
      );
    },
    RegistrationDetailsRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.RegistrationDetailsPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ProfilePage(),
      );
    },
    GalleryRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.GalleryPage(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.AuthPage(),
      );
    },
    CheckInRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.CheckInPage(),
      );
    },
    SponsorsRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.SponsorsPage(),
      );
    },
    EventInfoRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.EventInfoPage(),
      );
    },
    ProgramItemDetails.name: (routeData) {
      final args = routeData.argsAs<ProgramItemDetailsArgs>();
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.ProgramItemDetails(
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
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.EventSpeakerDetailsPage(
          key: args.key,
          speaker: args.speaker,
        ),
      );
    },
  };

  @override
  List<_i17.RouteConfig> get routes => [
        _i17.RouteConfig(
          AppStartupScreen.name,
          path: '/',
        ),
        _i17.RouteConfig(
          EventListRoute.name,
          path: '/events',
        ),
        _i17.RouteConfig(
          EventHomeRoute.name,
          path: '/event-home',
          children: [
            _i17.RouteConfig(
              EventProgramRoute.name,
              path: 'program',
              parent: EventHomeRoute.name,
              children: [
                _i17.RouteConfig(
                  EventInfoRoute.name,
                  path: 'info',
                  parent: EventProgramRoute.name,
                ),
                _i17.RouteConfig(
                  ProgramItemDetails.name,
                  path: 'program-details',
                  parent: EventProgramRoute.name,
                ),
              ],
            ),
            _i17.RouteConfig(
              FavouritesRoute.name,
              path: 'favourtes',
              parent: EventHomeRoute.name,
            ),
            _i17.RouteConfig(
              CheckedInUsersListRoute.name,
              path: 'checked-in-users',
              parent: EventHomeRoute.name,
            ),
            _i17.RouteConfig(
              EventSpeakersRoute.name,
              path: 'speakers',
              parent: EventHomeRoute.name,
              children: [
                _i17.RouteConfig(
                  EventSpeakerDetailsRoute.name,
                  path: 'speaker-details',
                  parent: EventSpeakersRoute.name,
                )
              ],
            ),
            _i17.RouteConfig(
              RegistrationDetailsRoute.name,
              path: 'registration-details',
              parent: EventHomeRoute.name,
            ),
            _i17.RouteConfig(
              ProfileRoute.name,
              path: 'profile',
              parent: EventHomeRoute.name,
            ),
            _i17.RouteConfig(
              GalleryRoute.name,
              path: 'gallery',
              parent: EventHomeRoute.name,
            ),
            _i17.RouteConfig(
              AuthRoute.name,
              path: 'auth',
              parent: EventHomeRoute.name,
            ),
            _i17.RouteConfig(
              CheckInRoute.name,
              path: 'check-in',
              parent: EventHomeRoute.name,
            ),
            _i17.RouteConfig(
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
class AppStartupScreen extends _i17.PageRouteInfo<void> {
  const AppStartupScreen()
      : super(
          AppStartupScreen.name,
          path: '/',
        );

  static const String name = 'AppStartupScreen';
}

/// generated route for
/// [_i2.EventListPage]
class EventListRoute extends _i17.PageRouteInfo<void> {
  const EventListRoute()
      : super(
          EventListRoute.name,
          path: '/events',
        );

  static const String name = 'EventListRoute';
}

/// generated route for
/// [_i3.EventHomePage]
class EventHomeRoute extends _i17.PageRouteInfo<EventHomeRouteArgs> {
  EventHomeRoute({
    _i18.Key? key,
    List<_i17.PageRouteInfo>? children,
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

  final _i18.Key? key;

  @override
  String toString() {
    return 'EventHomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.EventProgramPage]
class EventProgramRoute extends _i17.PageRouteInfo<EventProgramRouteArgs> {
  EventProgramRoute({
    _i18.Key? key,
    _i19.ProgramItemModel? selectedProgramItem,
    List<_i17.PageRouteInfo>? children,
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

  final _i18.Key? key;

  final _i19.ProgramItemModel? selectedProgramItem;

  @override
  String toString() {
    return 'EventProgramRouteArgs{key: $key, selectedProgramItem: $selectedProgramItem}';
  }
}

/// generated route for
/// [_i5.FavouritesPage]
class FavouritesRoute extends _i17.PageRouteInfo<void> {
  const FavouritesRoute()
      : super(
          FavouritesRoute.name,
          path: 'favourtes',
        );

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i6.CheckedInUsersListPage]
class CheckedInUsersListRoute extends _i17.PageRouteInfo<void> {
  const CheckedInUsersListRoute()
      : super(
          CheckedInUsersListRoute.name,
          path: 'checked-in-users',
        );

  static const String name = 'CheckedInUsersListRoute';
}

/// generated route for
/// [_i7.EventSpeakersPage]
class EventSpeakersRoute extends _i17.PageRouteInfo<void> {
  const EventSpeakersRoute({List<_i17.PageRouteInfo>? children})
      : super(
          EventSpeakersRoute.name,
          path: 'speakers',
          initialChildren: children,
        );

  static const String name = 'EventSpeakersRoute';
}

/// generated route for
/// [_i8.RegistrationDetailsPage]
class RegistrationDetailsRoute extends _i17.PageRouteInfo<void> {
  const RegistrationDetailsRoute()
      : super(
          RegistrationDetailsRoute.name,
          path: 'registration-details',
        );

  static const String name = 'RegistrationDetailsRoute';
}

/// generated route for
/// [_i9.ProfilePage]
class ProfileRoute extends _i17.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i10.GalleryPage]
class GalleryRoute extends _i17.PageRouteInfo<void> {
  const GalleryRoute()
      : super(
          GalleryRoute.name,
          path: 'gallery',
        );

  static const String name = 'GalleryRoute';
}

/// generated route for
/// [_i11.AuthPage]
class AuthRoute extends _i17.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: 'auth',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i12.CheckInPage]
class CheckInRoute extends _i17.PageRouteInfo<void> {
  const CheckInRoute()
      : super(
          CheckInRoute.name,
          path: 'check-in',
        );

  static const String name = 'CheckInRoute';
}

/// generated route for
/// [_i13.SponsorsPage]
class SponsorsRoute extends _i17.PageRouteInfo<void> {
  const SponsorsRoute()
      : super(
          SponsorsRoute.name,
          path: 'sponsors',
        );

  static const String name = 'SponsorsRoute';
}

/// generated route for
/// [_i14.EventInfoPage]
class EventInfoRoute extends _i17.PageRouteInfo<void> {
  const EventInfoRoute()
      : super(
          EventInfoRoute.name,
          path: 'info',
        );

  static const String name = 'EventInfoRoute';
}

/// generated route for
/// [_i15.ProgramItemDetails]
class ProgramItemDetails extends _i17.PageRouteInfo<ProgramItemDetailsArgs> {
  ProgramItemDetails({
    _i18.Key? key,
    required _i19.ProgramItemModel presentation,
    required void Function() onTap,
    required bool showBody,
    required bool showLoveButton,
  }) : super(
          ProgramItemDetails.name,
          path: 'program-details',
          args: ProgramItemDetailsArgs(
            key: key,
            presentation: presentation,
            onTap: onTap,
            showBody: showBody,
            showLoveButton: showLoveButton,
          ),
        );

  static const String name = 'ProgramItemDetails';
}

class ProgramItemDetailsArgs {
  const ProgramItemDetailsArgs({
    this.key,
    required this.presentation,
    required this.onTap,
    required this.showBody,
    required this.showLoveButton,
  });

  final _i18.Key? key;

  final _i19.ProgramItemModel presentation;

  final void Function() onTap;

  final bool showBody;

  final bool showLoveButton;

  @override
  String toString() {
    return 'ProgramItemDetailsArgs{key: $key, presentation: $presentation, onTap: $onTap, showBody: $showBody, showLoveButton: $showLoveButton}';
  }
}

/// generated route for
/// [_i16.EventSpeakerDetailsPage]
class EventSpeakerDetailsRoute
    extends _i17.PageRouteInfo<EventSpeakerDetailsRouteArgs> {
  EventSpeakerDetailsRoute({
    _i18.Key? key,
    required _i20.AuthorModel speaker,
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

  final _i18.Key? key;

  final _i20.AuthorModel speaker;

  @override
  String toString() {
    return 'EventSpeakerDetailsRouteArgs{key: $key, speaker: $speaker}';
  }
}
