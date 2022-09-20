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
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../models/program_item_model.dart' as _i14;
import '../pages/auth/auth_page.dart' as _i8;
import '../pages/checkin_page.dart' as _i9;
import '../pages/event/event_program_page.dart' as _i3;
import '../pages/event/main/event_gallery_page.dart' as _i7;
import '../pages/event/main/event_info_page.dart' as _i10;
import '../pages/event/main/program_list_page.dart' as _i11;
import '../pages/event_list_page.dart' as _i1;
import '../pages/favourites_page.dart' as _i4;
import '../pages/main/main_page.dart' as _i2;
import '../pages/profile_page.dart' as _i6;
import '../pages/registration_details_page.dart' as _i5;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    EventListRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EventListPage());
    },
    MainRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.MainPage());
    },
    EventMainRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EventProgramPage());
    },
    FavouritesRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.FavouritesPage());
    },
    RegistrationDetailsRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.RegistrationDetailsPage());
    },
    ProfileRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ProfilePage());
    },
    GalleryRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.GalleryPage());
    },
    AuthRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.AuthPage());
    },
    CheckInRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.CheckInPage());
    },
    EventInfoRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.EventInfoPage());
    },
    ProgramListRoute.name: (routeData) {
      final args = routeData.argsAs<ProgramListRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.ProgramListPage(args.programData, key: args.key));
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig('/#redirect',
            path: '/', redirectTo: '/events', fullMatch: true),
        _i12.RouteConfig(EventListRoute.name, path: '/events'),
        _i12.RouteConfig(MainRoute.name, path: '/main', children: [
          _i12.RouteConfig(EventMainRoute.name,
              path: 'event',
              parent: MainRoute.name,
              children: [
                _i12.RouteConfig(EventInfoRoute.name,
                    path: 'info', parent: EventMainRoute.name),
                _i12.RouteConfig(ProgramListRoute.name,
                    path: 'program', parent: EventMainRoute.name)
              ]),
          _i12.RouteConfig(FavouritesRoute.name,
              path: 'favourtes', parent: MainRoute.name),
          _i12.RouteConfig(RegistrationDetailsRoute.name,
              path: 'registration-details', parent: MainRoute.name),
          _i12.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: MainRoute.name),
          _i12.RouteConfig(GalleryRoute.name,
              path: 'gallery', parent: MainRoute.name),
          _i12.RouteConfig(AuthRoute.name,
              path: 'auth', parent: MainRoute.name),
          _i12.RouteConfig(CheckInRoute.name,
              path: 'check-in', parent: MainRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.EventListPage]
class EventListRoute extends _i12.PageRouteInfo<void> {
  const EventListRoute() : super(EventListRoute.name, path: '/events');

  static const String name = 'EventListRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i12.PageRouteInfo<void> {
  const MainRoute({List<_i12.PageRouteInfo>? children})
      : super(MainRoute.name, path: '/main', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.EventProgramPage]
class EventMainRoute extends _i12.PageRouteInfo<void> {
  const EventMainRoute({List<_i12.PageRouteInfo>? children})
      : super(EventMainRoute.name, path: 'event', initialChildren: children);

  static const String name = 'EventMainRoute';
}

/// generated route for
/// [_i4.FavouritesPage]
class FavouritesRoute extends _i12.PageRouteInfo<void> {
  const FavouritesRoute() : super(FavouritesRoute.name, path: 'favourtes');

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i5.RegistrationDetailsPage]
class RegistrationDetailsRoute extends _i12.PageRouteInfo<void> {
  const RegistrationDetailsRoute()
      : super(RegistrationDetailsRoute.name, path: 'registration-details');

  static const String name = 'RegistrationDetailsRoute';
}

/// generated route for
/// [_i6.ProfilePage]
class ProfileRoute extends _i12.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i7.GalleryPage]
class GalleryRoute extends _i12.PageRouteInfo<void> {
  const GalleryRoute() : super(GalleryRoute.name, path: 'gallery');

  static const String name = 'GalleryRoute';
}

/// generated route for
/// [_i8.AuthPage]
class AuthRoute extends _i12.PageRouteInfo<void> {
  const AuthRoute() : super(AuthRoute.name, path: 'auth');

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i9.CheckInPage]
class CheckInRoute extends _i12.PageRouteInfo<void> {
  const CheckInRoute() : super(CheckInRoute.name, path: 'check-in');

  static const String name = 'CheckInRoute';
}

/// generated route for
/// [_i10.EventInfoPage]
class EventInfoRoute extends _i12.PageRouteInfo<void> {
  const EventInfoRoute() : super(EventInfoRoute.name, path: 'info');

  static const String name = 'EventInfoRoute';
}

/// generated route for
/// [_i11.ProgramListPage]
class ProgramListRoute extends _i12.PageRouteInfo<ProgramListRouteArgs> {
  ProgramListRoute(
      {required List<_i14.ProgramItemModel> programData, _i13.Key? key})
      : super(ProgramListRoute.name,
            path: 'program',
            args: ProgramListRouteArgs(programData: programData, key: key));

  static const String name = 'ProgramListRoute';
}

class ProgramListRouteArgs {
  const ProgramListRouteArgs({required this.programData, this.key});

  final List<_i14.ProgramItemModel> programData;

  final _i13.Key? key;

  @override
  String toString() {
    return 'ProgramListRouteArgs{programData: $programData, key: $key}';
  }
}
