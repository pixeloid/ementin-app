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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../pages/auth/auth_page.dart' as _i8;
import '../pages/checkin_page.dart' as _i9;
import '../pages/event/event_program_page.dart' as _i3;
import '../pages/event/main/event_gallery_page.dart' as _i7;
import '../pages/event/main/presentation_details_page.dart' as _i10;
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
        routeData: routeData,
        child: const _i1.EventListPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MainPage(),
      );
    },
    ProgramRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EventProgramPage(),
      );
    },
    FavouritesRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.FavouritesPage(),
      );
    },
    RegistrationDetailsRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.RegistrationDetailsPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.ProfilePage(),
      );
    },
    GalleryRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.GalleryPage(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.AuthPage(),
      );
    },
    CheckInRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.CheckInPage(),
      );
    },
    PresentationDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PresentationDetailsRouteArgs>(
          orElse: () => PresentationDetailsRouteArgs(
              programItemId: pathParams.getInt('programItemId')));
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.PresentationDetailsPage(
          key: args.key,
          programItemId: args.programItemId,
        ),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/events',
          fullMatch: true,
        ),
        _i11.RouteConfig(
          EventListRoute.name,
          path: '/events',
        ),
        _i11.RouteConfig(
          MainRoute.name,
          path: '/main',
          children: [
            _i11.RouteConfig(
              ProgramRouter.name,
              path: 'event',
              parent: MainRoute.name,
              children: [
                _i11.RouteConfig(
                  PresentationDetailsRoute.name,
                  path: 'presentation-details/:programItemId',
                  parent: ProgramRouter.name,
                ),
                _i11.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: ProgramRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            _i11.RouteConfig(
              FavouritesRoute.name,
              path: 'favourtes',
              parent: MainRoute.name,
            ),
            _i11.RouteConfig(
              RegistrationDetailsRoute.name,
              path: 'registration-details',
              parent: MainRoute.name,
            ),
            _i11.RouteConfig(
              ProfileRoute.name,
              path: 'profile',
              parent: MainRoute.name,
            ),
            _i11.RouteConfig(
              GalleryRoute.name,
              path: 'gallery',
              parent: MainRoute.name,
            ),
            _i11.RouteConfig(
              AuthRoute.name,
              path: 'auth',
              parent: MainRoute.name,
            ),
            _i11.RouteConfig(
              CheckInRoute.name,
              path: 'check-in',
              parent: MainRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.EventListPage]
class EventListRoute extends _i11.PageRouteInfo<void> {
  const EventListRoute()
      : super(
          EventListRoute.name,
          path: '/events',
        );

  static const String name = 'EventListRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i11.PageRouteInfo<void> {
  const MainRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/main',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.EventProgramPage]
class ProgramRouter extends _i11.PageRouteInfo<void> {
  const ProgramRouter({List<_i11.PageRouteInfo>? children})
      : super(
          ProgramRouter.name,
          path: 'event',
          initialChildren: children,
        );

  static const String name = 'ProgramRouter';
}

/// generated route for
/// [_i4.FavouritesPage]
class FavouritesRoute extends _i11.PageRouteInfo<void> {
  const FavouritesRoute()
      : super(
          FavouritesRoute.name,
          path: 'favourtes',
        );

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i5.RegistrationDetailsPage]
class RegistrationDetailsRoute extends _i11.PageRouteInfo<void> {
  const RegistrationDetailsRoute()
      : super(
          RegistrationDetailsRoute.name,
          path: 'registration-details',
        );

  static const String name = 'RegistrationDetailsRoute';
}

/// generated route for
/// [_i6.ProfilePage]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i7.GalleryPage]
class GalleryRoute extends _i11.PageRouteInfo<void> {
  const GalleryRoute()
      : super(
          GalleryRoute.name,
          path: 'gallery',
        );

  static const String name = 'GalleryRoute';
}

/// generated route for
/// [_i8.AuthPage]
class AuthRoute extends _i11.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: 'auth',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i9.CheckInPage]
class CheckInRoute extends _i11.PageRouteInfo<void> {
  const CheckInRoute()
      : super(
          CheckInRoute.name,
          path: 'check-in',
        );

  static const String name = 'CheckInRoute';
}

/// generated route for
/// [_i10.PresentationDetailsPage]
class PresentationDetailsRoute
    extends _i11.PageRouteInfo<PresentationDetailsRouteArgs> {
  PresentationDetailsRoute({
    _i12.Key? key,
    required int programItemId,
  }) : super(
          PresentationDetailsRoute.name,
          path: 'presentation-details/:programItemId',
          args: PresentationDetailsRouteArgs(
            key: key,
            programItemId: programItemId,
          ),
          rawPathParams: {'programItemId': programItemId},
        );

  static const String name = 'PresentationDetailsRoute';
}

class PresentationDetailsRouteArgs {
  const PresentationDetailsRouteArgs({
    this.key,
    required this.programItemId,
  });

  final _i12.Key? key;

  final int programItemId;

  @override
  String toString() {
    return 'PresentationDetailsRouteArgs{key: $key, programItemId: $programItemId}';
  }
}
