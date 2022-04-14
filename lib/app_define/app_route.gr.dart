// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../pages/auth/auth_page.dart' as _i5;
import '../pages/event/event_main_page.dart' as _i3;
import '../pages/event/main/event_info_page.dart' as _i6;
import '../pages/event/main/event_program_page.dart' as _i7;
import '../pages/event_list_page.dart' as _i1;
import '../pages/main/main_page.dart' as _i2;
import '../pages/profile_page.dart' as _i4;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    EventListRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EventListPage());
    },
    MainRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.MainPage());
    },
    EventMainRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EventMainPage());
    },
    ProfileRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ProfilePage());
    },
    AuthRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.AuthPage());
    },
    EventInfoRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EventInfoPage());
    },
    EventProgramRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.EventProgramPage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig('/#redirect',
            path: '/', redirectTo: '/events', fullMatch: true),
        _i8.RouteConfig(EventListRoute.name, path: '/events'),
        _i8.RouteConfig(MainRoute.name, path: '/main', children: [
          _i8.RouteConfig(EventMainRoute.name,
              path: 'event',
              parent: MainRoute.name,
              children: [
                _i8.RouteConfig(EventInfoRoute.name,
                    path: 'info', parent: EventMainRoute.name),
                _i8.RouteConfig(EventProgramRoute.name,
                    path: 'program', parent: EventMainRoute.name)
              ]),
          _i8.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: MainRoute.name),
          _i8.RouteConfig(AuthRoute.name, path: 'auth', parent: MainRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.EventListPage]
class EventListRoute extends _i8.PageRouteInfo<void> {
  const EventListRoute() : super(EventListRoute.name, path: '/events');

  static const String name = 'EventListRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
      : super(MainRoute.name, path: '/main', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.EventMainPage]
class EventMainRoute extends _i8.PageRouteInfo<void> {
  const EventMainRoute({List<_i8.PageRouteInfo>? children})
      : super(EventMainRoute.name, path: 'event', initialChildren: children);

  static const String name = 'EventMainRoute';
}

/// generated route for
/// [_i4.ProfilePage]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i5.AuthPage]
class AuthRoute extends _i8.PageRouteInfo<void> {
  const AuthRoute() : super(AuthRoute.name, path: 'auth');

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i6.EventInfoPage]
class EventInfoRoute extends _i8.PageRouteInfo<void> {
  const EventInfoRoute() : super(EventInfoRoute.name, path: 'info');

  static const String name = 'EventInfoRoute';
}

/// generated route for
/// [_i7.EventProgramPage]
class EventProgramRoute extends _i8.PageRouteInfo<void> {
  const EventProgramRoute() : super(EventProgramRoute.name, path: 'program');

  static const String name = 'EventProgramRoute';
}
