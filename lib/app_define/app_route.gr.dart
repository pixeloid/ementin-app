// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../pages/auth/auth_page.dart' as _i7;
import '../pages/checkin_page.dart' as _i6;
import '../pages/event/event_main_page.dart' as _i3;
import '../pages/event/main/event_info_page.dart' as _i8;
import '../pages/event/main/event_program_page.dart' as _i9;
import '../pages/event_list_page.dart' as _i1;
import '../pages/favourites_page.dart' as _i4;
import '../pages/main/main_page.dart' as _i2;
import '../pages/profile_page.dart' as _i5;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    EventListRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EventListPage());
    },
    MainRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.MainPage());
    },
    EventMainRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EventMainPage());
    },
    FavouritesRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.FavouritesPage());
    },
    ProfileRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ProfilePage());
    },
    CheckInRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.CheckInPage());
    },
    AuthRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.AuthPage());
    },
    EventInfoRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.EventInfoPage());
    },
    EventProgramRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.EventProgramPage());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig('/#redirect',
            path: '/', redirectTo: '/events', fullMatch: true),
        _i10.RouteConfig(EventListRoute.name, path: '/events'),
        _i10.RouteConfig(MainRoute.name, path: '/main', children: [
          _i10.RouteConfig(EventMainRoute.name,
              path: 'event',
              parent: MainRoute.name,
              children: [
                _i10.RouteConfig(EventInfoRoute.name,
                    path: 'info', parent: EventMainRoute.name),
                _i10.RouteConfig(EventProgramRoute.name,
                    path: 'program', parent: EventMainRoute.name)
              ]),
          _i10.RouteConfig(FavouritesRoute.name,
              path: 'favourtes', parent: MainRoute.name),
          _i10.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: MainRoute.name),
          _i10.RouteConfig(CheckInRoute.name,
              path: 'check-in', parent: MainRoute.name),
          _i10.RouteConfig(AuthRoute.name, path: 'auth', parent: MainRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.EventListPage]
class EventListRoute extends _i10.PageRouteInfo<void> {
  const EventListRoute() : super(EventListRoute.name, path: '/events');

  static const String name = 'EventListRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i10.PageRouteInfo<void> {
  const MainRoute({List<_i10.PageRouteInfo>? children})
      : super(MainRoute.name, path: '/main', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.EventMainPage]
class EventMainRoute extends _i10.PageRouteInfo<void> {
  const EventMainRoute({List<_i10.PageRouteInfo>? children})
      : super(EventMainRoute.name, path: 'event', initialChildren: children);

  static const String name = 'EventMainRoute';
}

/// generated route for
/// [_i4.FavouritesPage]
class FavouritesRoute extends _i10.PageRouteInfo<void> {
  const FavouritesRoute() : super(FavouritesRoute.name, path: 'favourtes');

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i6.CheckInPage]
class CheckInRoute extends _i10.PageRouteInfo<void> {
  const CheckInRoute() : super(CheckInRoute.name, path: 'check-in');

  static const String name = 'CheckInRoute';
}

/// generated route for
/// [_i7.AuthPage]
class AuthRoute extends _i10.PageRouteInfo<void> {
  const AuthRoute() : super(AuthRoute.name, path: 'auth');

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i8.EventInfoPage]
class EventInfoRoute extends _i10.PageRouteInfo<void> {
  const EventInfoRoute() : super(EventInfoRoute.name, path: 'info');

  static const String name = 'EventInfoRoute';
}

/// generated route for
/// [_i9.EventProgramPage]
class EventProgramRoute extends _i10.PageRouteInfo<void> {
  const EventProgramRoute() : super(EventProgramRoute.name, path: 'program');

  static const String name = 'EventProgramRoute';
}
