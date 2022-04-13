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

import '../models/event_model.dart' as _i6;
import '../pages/auth/p_auth.dart' as _i2;
import '../pages/p_event.dart' as _i3;
import '../pages/p_home.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    PHome.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.PHome());
    },
    AuthScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.AuthScreen());
    },
    PEvent.name: (routeData) {
      final args =
          routeData.argsAs<PEventArgs>(orElse: () => const PEventArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.PEvent(key: args.key, event: args.event));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(PHome.name, path: '/'),
        _i4.RouteConfig(AuthScreen.name, path: '/auth-screen'),
        _i4.RouteConfig(PEvent.name, path: '/p-event')
      ];
}

/// generated route for
/// [_i1.PHome]
class PHome extends _i4.PageRouteInfo<void> {
  const PHome() : super(PHome.name, path: '/');

  static const String name = 'PHome';
}

/// generated route for
/// [_i2.AuthScreen]
class AuthScreen extends _i4.PageRouteInfo<void> {
  const AuthScreen() : super(AuthScreen.name, path: '/auth-screen');

  static const String name = 'AuthScreen';
}

/// generated route for
/// [_i3.PEvent]
class PEvent extends _i4.PageRouteInfo<PEventArgs> {
  PEvent({_i5.Key? key, _i6.EventModel? event})
      : super(PEvent.name,
            path: '/p-event', args: PEventArgs(key: key, event: event));

  static const String name = 'PEvent';
}

class PEventArgs {
  const PEventArgs({this.key, this.event});

  final _i5.Key? key;

  final _i6.EventModel? event;

  @override
  String toString() {
    return 'PEventArgs{key: $key, event: $event}';
  }
}
