// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../pages/auth/auth_page.dart' as _i8;
import '../pages/checkin_page.dart' as _i7;
import '../pages/event/event_main_page.dart' as _i3;
import '../pages/event/main/event_info_page.dart' as _i9;
import '../pages/event/main/event_program_page.dart' as _i10;
import '../pages/event_list_page.dart' as _i1;
import '../pages/favourites_page.dart' as _i4;
import '../pages/main/main_page.dart' as _i2;
import '../pages/profile_page.dart' as _i6;
import '../pages/registration_details_page.dart' as _i5;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    EventListRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EventListPage());
    },
    MainRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.MainPage());
    },
    EventMainRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EventMainPage());
    },
    FavouritesRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.FavouritesPage());
    },
    RegistrationDetailsRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.RegistrationDetailsPage());
    },
    ProfileRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ProfilePage());
    },
    CheckInRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.CheckInPage());
    },
    AuthRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.AuthPage());
    },
    EventInfoRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.EventInfoPage());
    },
    EventProgramRoute.name: (routeData) {
      final args = routeData.argsAs<EventProgramRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.EventProgramPage(key: args.key, date: args.date));
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig('/#redirect',
            path: '/', redirectTo: '/events', fullMatch: true),
        _i11.RouteConfig(EventListRoute.name, path: '/events'),
        _i11.RouteConfig(MainRoute.name, path: '/main', children: [
          _i11.RouteConfig(EventMainRoute.name,
              path: 'event',
              parent: MainRoute.name,
              children: [
                _i11.RouteConfig(EventInfoRoute.name,
                    path: 'info', parent: EventMainRoute.name),
                _i11.RouteConfig(EventProgramRoute.name,
                    path: 'program', parent: EventMainRoute.name)
              ]),
          _i11.RouteConfig(FavouritesRoute.name,
              path: 'favourtes', parent: MainRoute.name),
          _i11.RouteConfig(RegistrationDetailsRoute.name,
              path: 'registration-details', parent: MainRoute.name),
          _i11.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: MainRoute.name),
          _i11.RouteConfig(CheckInRoute.name,
              path: 'check-in', parent: MainRoute.name),
          _i11.RouteConfig(AuthRoute.name, path: 'auth', parent: MainRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.EventListPage]
class EventListRoute extends _i11.PageRouteInfo<void> {
  const EventListRoute() : super(EventListRoute.name, path: '/events');

  static const String name = 'EventListRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i11.PageRouteInfo<void> {
  const MainRoute({List<_i11.PageRouteInfo>? children})
      : super(MainRoute.name, path: '/main', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.EventMainPage]
class EventMainRoute extends _i11.PageRouteInfo<void> {
  const EventMainRoute({List<_i11.PageRouteInfo>? children})
      : super(EventMainRoute.name, path: 'event', initialChildren: children);

  static const String name = 'EventMainRoute';
}

/// generated route for
/// [_i4.FavouritesPage]
class FavouritesRoute extends _i11.PageRouteInfo<void> {
  const FavouritesRoute() : super(FavouritesRoute.name, path: 'favourtes');

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i5.RegistrationDetailsPage]
class RegistrationDetailsRoute extends _i11.PageRouteInfo<void> {
  const RegistrationDetailsRoute()
      : super(RegistrationDetailsRoute.name, path: 'registration-details');

  static const String name = 'RegistrationDetailsRoute';
}

/// generated route for
/// [_i6.ProfilePage]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i7.CheckInPage]
class CheckInRoute extends _i11.PageRouteInfo<void> {
  const CheckInRoute() : super(CheckInRoute.name, path: 'check-in');

  static const String name = 'CheckInRoute';
}

/// generated route for
/// [_i8.AuthPage]
class AuthRoute extends _i11.PageRouteInfo<void> {
  const AuthRoute() : super(AuthRoute.name, path: 'auth');

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i9.EventInfoPage]
class EventInfoRoute extends _i11.PageRouteInfo<void> {
  const EventInfoRoute() : super(EventInfoRoute.name, path: 'info');

  static const String name = 'EventInfoRoute';
}

/// generated route for
/// [_i10.EventProgramPage]
class EventProgramRoute extends _i11.PageRouteInfo<EventProgramRouteArgs> {
  EventProgramRoute({_i12.Key? key, required DateTime date})
      : super(EventProgramRoute.name,
            path: 'program', args: EventProgramRouteArgs(key: key, date: date));

  static const String name = 'EventProgramRoute';
}

class EventProgramRouteArgs {
  const EventProgramRouteArgs({this.key, required this.date});

  final _i12.Key? key;

  final DateTime date;

  @override
  String toString() {
    return 'EventProgramRouteArgs{key: $key, date: $date}';
  }
}
