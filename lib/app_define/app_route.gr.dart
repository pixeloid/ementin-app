// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:eventapp/models/author/author.dart' as _i19;
import 'package:eventapp/models/program_item_model.dart' as _i18;
import 'package:eventapp/models/schedule_model.dart' as _i20;
import 'package:eventapp/pages/auth/auth_page.dart' as _i1;
import 'package:eventapp/pages/checkin_page.dart' as _i2;
import 'package:eventapp/pages/event/event_program_page.dart' as _i5;
import 'package:eventapp/pages/event/event_speaker_details_page.dart' as _i6;
import 'package:eventapp/pages/event/event_speakers_page.dart' as _i7;
import 'package:eventapp/pages/event/main/event_gallery_page.dart' as _i9;
import 'package:eventapp/pages/event/main/event_info_page.dart' as _i3;
import 'package:eventapp/pages/event/main/event_sponsors_page.dart' as _i15;
import 'package:eventapp/pages/event/main/program_list_page.dart' as _i14;
import 'package:eventapp/pages/event/main/widgets/program_item_hero.dart'
    as _i12;
import 'package:eventapp/pages/event_list_page.dart' as _i4;
import 'package:eventapp/pages/favourites_page.dart' as _i8;
import 'package:eventapp/pages/main/main_page.dart' as _i10;
import 'package:eventapp/pages/profile_page.dart' as _i11;
import 'package:eventapp/pages/registration_details_page.dart' as _i13;
import 'package:flutter/material.dart' as _i17;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthPage(),
      );
    },
    CheckInRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CheckInPage(),
      );
    },
    EventInfoRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EventInfoPage(),
      );
    },
    EventListRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.EventListPage(),
      );
    },
    EventProgramRoute.name: (routeData) {
      final args = routeData.argsAs<EventProgramRouteArgs>(
          orElse: () => const EventProgramRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.EventProgramPage(
          key: args.key,
          selectedProgramItem: args.selectedProgramItem,
        ),
      );
    },
    EventSpeakerDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<EventSpeakerDetailsRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.EventSpeakerDetailsPage(
          key: args.key,
          author: args.author,
        ),
      );
    },
    EventSpeakersRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.EventSpeakersPage(),
      );
    },
    FavouritesRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.FavouritesPage(),
      );
    },
    GalleryRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.GalleryPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MainPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ProfilePage(),
      );
    },
    ProgramItemFullHeroRoute.name: (routeData) {
      final args = routeData.argsAs<ProgramItemFullHeroRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.ProgramItemFullHeroPage(
          key: args.key,
          presentation: args.presentation,
          onTap: args.onTap,
          showBody: args.showBody,
          showLoveButton: args.showLoveButton,
          showDayName: args.showDayName,
        ),
      );
    },
    RegistrationDetailsRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.RegistrationDetailsPage(),
      );
    },
    ScheduleEventList.name: (routeData) {
      final args = routeData.argsAs<ScheduleEventListArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.ScheduleEventList(
          args.scheduleDay,
          key: args.key,
        ),
      );
    },
    SponsorsRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SponsorsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i16.PageRouteInfo<void> {
  const AuthRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CheckInPage]
class CheckInRoute extends _i16.PageRouteInfo<void> {
  const CheckInRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CheckInRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckInRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EventInfoPage]
class EventInfoRoute extends _i16.PageRouteInfo<void> {
  const EventInfoRoute({List<_i16.PageRouteInfo>? children})
      : super(
          EventInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventInfoRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EventListPage]
class EventListRoute extends _i16.PageRouteInfo<void> {
  const EventListRoute({List<_i16.PageRouteInfo>? children})
      : super(
          EventListRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventListRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.EventProgramPage]
class EventProgramRoute extends _i16.PageRouteInfo<EventProgramRouteArgs> {
  EventProgramRoute({
    _i17.Key? key,
    _i18.ProgramItemModel? selectedProgramItem,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          EventProgramRoute.name,
          args: EventProgramRouteArgs(
            key: key,
            selectedProgramItem: selectedProgramItem,
          ),
          initialChildren: children,
        );

  static const String name = 'EventProgramRoute';

  static const _i16.PageInfo<EventProgramRouteArgs> page =
      _i16.PageInfo<EventProgramRouteArgs>(name);
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
/// [_i6.EventSpeakerDetailsPage]
class EventSpeakerDetailsRoute
    extends _i16.PageRouteInfo<EventSpeakerDetailsRouteArgs> {
  EventSpeakerDetailsRoute({
    _i17.Key? key,
    required _i19.Author author,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          EventSpeakerDetailsRoute.name,
          args: EventSpeakerDetailsRouteArgs(
            key: key,
            author: author,
          ),
          initialChildren: children,
        );

  static const String name = 'EventSpeakerDetailsRoute';

  static const _i16.PageInfo<EventSpeakerDetailsRouteArgs> page =
      _i16.PageInfo<EventSpeakerDetailsRouteArgs>(name);
}

class EventSpeakerDetailsRouteArgs {
  const EventSpeakerDetailsRouteArgs({
    this.key,
    required this.author,
  });

  final _i17.Key? key;

  final _i19.Author author;

  @override
  String toString() {
    return 'EventSpeakerDetailsRouteArgs{key: $key, author: $author}';
  }
}

/// generated route for
/// [_i7.EventSpeakersPage]
class EventSpeakersRoute extends _i16.PageRouteInfo<void> {
  const EventSpeakersRoute({List<_i16.PageRouteInfo>? children})
      : super(
          EventSpeakersRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventSpeakersRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i8.FavouritesPage]
class FavouritesRoute extends _i16.PageRouteInfo<void> {
  const FavouritesRoute({List<_i16.PageRouteInfo>? children})
      : super(
          FavouritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavouritesRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.GalleryPage]
class GalleryRoute extends _i16.PageRouteInfo<void> {
  const GalleryRoute({List<_i16.PageRouteInfo>? children})
      : super(
          GalleryRoute.name,
          initialChildren: children,
        );

  static const String name = 'GalleryRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i10.MainPage]
class MainRoute extends _i16.PageRouteInfo<void> {
  const MainRoute({List<_i16.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ProfilePage]
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ProgramItemFullHeroPage]
class ProgramItemFullHeroRoute
    extends _i16.PageRouteInfo<ProgramItemFullHeroRouteArgs> {
  ProgramItemFullHeroRoute({
    _i17.Key? key,
    required _i20.ScheduleEvent presentation,
    required void Function() onTap,
    required bool showBody,
    required bool showLoveButton,
    bool showDayName = false,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          ProgramItemFullHeroRoute.name,
          args: ProgramItemFullHeroRouteArgs(
            key: key,
            presentation: presentation,
            onTap: onTap,
            showBody: showBody,
            showLoveButton: showLoveButton,
            showDayName: showDayName,
          ),
          initialChildren: children,
        );

  static const String name = 'ProgramItemFullHeroRoute';

  static const _i16.PageInfo<ProgramItemFullHeroRouteArgs> page =
      _i16.PageInfo<ProgramItemFullHeroRouteArgs>(name);
}

class ProgramItemFullHeroRouteArgs {
  const ProgramItemFullHeroRouteArgs({
    this.key,
    required this.presentation,
    required this.onTap,
    required this.showBody,
    required this.showLoveButton,
    this.showDayName = false,
  });

  final _i17.Key? key;

  final _i20.ScheduleEvent presentation;

  final void Function() onTap;

  final bool showBody;

  final bool showLoveButton;

  final bool showDayName;

  @override
  String toString() {
    return 'ProgramItemFullHeroRouteArgs{key: $key, presentation: $presentation, onTap: $onTap, showBody: $showBody, showLoveButton: $showLoveButton, showDayName: $showDayName}';
  }
}

/// generated route for
/// [_i13.RegistrationDetailsPage]
class RegistrationDetailsRoute extends _i16.PageRouteInfo<void> {
  const RegistrationDetailsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          RegistrationDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationDetailsRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ScheduleEventList]
class ScheduleEventList extends _i16.PageRouteInfo<ScheduleEventListArgs> {
  ScheduleEventList({
    required _i20.Day scheduleDay,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          ScheduleEventList.name,
          args: ScheduleEventListArgs(
            scheduleDay: scheduleDay,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ScheduleEventList';

  static const _i16.PageInfo<ScheduleEventListArgs> page =
      _i16.PageInfo<ScheduleEventListArgs>(name);
}

class ScheduleEventListArgs {
  const ScheduleEventListArgs({
    required this.scheduleDay,
    this.key,
  });

  final _i20.Day scheduleDay;

  final _i17.Key? key;

  @override
  String toString() {
    return 'ScheduleEventListArgs{scheduleDay: $scheduleDay, key: $key}';
  }
}

/// generated route for
/// [_i15.SponsorsPage]
class SponsorsRoute extends _i16.PageRouteInfo<void> {
  const SponsorsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SponsorsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SponsorsRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
