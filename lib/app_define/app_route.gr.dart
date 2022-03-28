// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../pages/auth/p_auth.dart' as _i2;
import '../pages/p_event.dart' as _i3;
import '../pages/p_home.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    Home.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.PHome());
    },
    AuthRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.AuthScreen());
    },
    EventRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.PEvent());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: 'home', fullMatch: true),
        _i4.RouteConfig(Home.name, path: 'home'),
        _i4.RouteConfig(AuthRouter.name, path: 'auth'),
        _i4.RouteConfig(EventRouter.name, path: 'event')
      ];
}

/// generated route for
/// [_i1.PHome]
class Home extends _i4.PageRouteInfo<void> {
  const Home() : super(Home.name, path: 'home');

  static const String name = 'Home';
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRouter extends _i4.PageRouteInfo<void> {
  const AuthRouter() : super(AuthRouter.name, path: 'auth');

  static const String name = 'AuthRouter';
}

/// generated route for
/// [_i3.PEvent]
class EventRouter extends _i4.PageRouteInfo<void> {
  const EventRouter() : super(EventRouter.name, path: 'event');

  static const String name = 'EventRouter';
}
