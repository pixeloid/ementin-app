// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../models/event_model.dart' as _i8;
import '../pages/auth/p_auth.dart' as _i2;
import '../pages/event/main/p_event_info.dart' as _i4;
import '../pages/event/main/p_event_program.dart' as _i5;
import '../pages/event/p_event_main.dart' as _i3;
import '../pages/p_event_list.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    PEventList.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.PEventList());
    },
    AuthScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.AuthScreen());
    },
    PEventMain.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.PEventMain());
    },
    PEventInfo.name: (routeData) {
      final args = routeData.argsAs<PEventInfoArgs>(
          orElse: () => const PEventInfoArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.PEventInfo(key: args.key, event: args.event));
    },
    PEventProgram.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.PEventProgram());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(PEventList.name, path: '/home'),
        _i6.RouteConfig(AuthScreen.name, path: '/auth'),
        _i6.RouteConfig(PEventMain.name, path: '/event', children: [
          _i6.RouteConfig(PEventInfo.name,
              path: 'info', parent: PEventMain.name),
          _i6.RouteConfig(PEventProgram.name,
              path: 'program', parent: PEventMain.name)
        ])
      ];
}

/// generated route for
/// [_i1.PEventList]
class PEventList extends _i6.PageRouteInfo<void> {
  const PEventList() : super(PEventList.name, path: '/home');

  static const String name = 'PEventList';
}

/// generated route for
/// [_i2.AuthScreen]
class AuthScreen extends _i6.PageRouteInfo<void> {
  const AuthScreen() : super(AuthScreen.name, path: '/auth');

  static const String name = 'AuthScreen';
}

/// generated route for
/// [_i3.PEventMain]
class PEventMain extends _i6.PageRouteInfo<void> {
  const PEventMain({List<_i6.PageRouteInfo>? children})
      : super(PEventMain.name, path: '/event', initialChildren: children);

  static const String name = 'PEventMain';
}

/// generated route for
/// [_i4.PEventInfo]
class PEventInfo extends _i6.PageRouteInfo<PEventInfoArgs> {
  PEventInfo({_i7.Key? key, _i8.EventModel? event})
      : super(PEventInfo.name,
            path: 'info', args: PEventInfoArgs(key: key, event: event));

  static const String name = 'PEventInfo';
}

class PEventInfoArgs {
  const PEventInfoArgs({this.key, this.event});

  final _i7.Key? key;

  final _i8.EventModel? event;

  @override
  String toString() {
    return 'PEventInfoArgs{key: $key, event: $event}';
  }
}

/// generated route for
/// [_i5.PEventProgram]
class PEventProgram extends _i6.PageRouteInfo<void> {
  const PEventProgram() : super(PEventProgram.name, path: 'program');

  static const String name = 'PEventProgram';
}
