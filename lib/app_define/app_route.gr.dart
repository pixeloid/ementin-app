// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:ementin_flutter/models/author/author.dart' as _i19;
import 'package:ementin_flutter/models/program_item_model.dart' as _i18;
import 'package:ementin_flutter/models/schedule_model.dart' as _i20;
import 'package:ementin_flutter/pages/auth/auth_page.dart' as _i1;
import 'package:ementin_flutter/pages/checkin_page.dart' as _i2;
import 'package:ementin_flutter/pages/event/event_program_page.dart' as _i5;
import 'package:ementin_flutter/pages/event/event_speaker_details_page.dart'
    as _i6;
import 'package:ementin_flutter/pages/event/event_speakers_page.dart' as _i7;
import 'package:ementin_flutter/pages/event/main/event_gallery_page.dart'
    as _i9;
import 'package:ementin_flutter/pages/event/main/event_info_page.dart' as _i3;
import 'package:ementin_flutter/pages/event/main/event_sponsors_page.dart'
    as _i15;
import 'package:ementin_flutter/pages/event/main/program_list_page.dart'
    as _i14;
import 'package:ementin_flutter/pages/event/main/widgets/program_item_hero.dart'
    as _i12;
import 'package:ementin_flutter/pages/event_list_page.dart' as _i4;
import 'package:ementin_flutter/pages/favourites_page.dart' as _i8;
import 'package:ementin_flutter/pages/main/main_page.dart' as _i10;
import 'package:ementin_flutter/pages/profile_page.dart' as _i11;
import 'package:ementin_flutter/pages/registration_details_page.dart' as _i13;
import 'package:flutter/material.dart' as _i17;

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i16.PageRouteInfo<void> {
  const AuthRoute({List<_i16.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthPage();
    },
  );
}

/// generated route for
/// [_i2.CheckInPage]
class CheckInRoute extends _i16.PageRouteInfo<void> {
  const CheckInRoute({List<_i16.PageRouteInfo>? children})
    : super(CheckInRoute.name, initialChildren: children);

  static const String name = 'CheckInRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i2.CheckInPage();
    },
  );
}

/// generated route for
/// [_i3.EventInfoPage]
class EventInfoRoute extends _i16.PageRouteInfo<void> {
  const EventInfoRoute({List<_i16.PageRouteInfo>? children})
    : super(EventInfoRoute.name, initialChildren: children);

  static const String name = 'EventInfoRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i3.EventInfoPage();
    },
  );
}

/// generated route for
/// [_i4.EventListPage]
class EventListRoute extends _i16.PageRouteInfo<void> {
  const EventListRoute({List<_i16.PageRouteInfo>? children})
    : super(EventListRoute.name, initialChildren: children);

  static const String name = 'EventListRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i4.EventListPage();
    },
  );
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

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventProgramRouteArgs>(
        orElse: () => const EventProgramRouteArgs(),
      );
      return _i5.EventProgramPage(
        key: args.key,
        selectedProgramItem: args.selectedProgramItem,
      );
    },
  );
}

class EventProgramRouteArgs {
  const EventProgramRouteArgs({this.key, this.selectedProgramItem});

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
         args: EventSpeakerDetailsRouteArgs(key: key, author: author),
         initialChildren: children,
       );

  static const String name = 'EventSpeakerDetailsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventSpeakerDetailsRouteArgs>();
      return _i6.EventSpeakerDetailsPage(key: args.key, author: args.author);
    },
  );
}

class EventSpeakerDetailsRouteArgs {
  const EventSpeakerDetailsRouteArgs({this.key, required this.author});

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
    : super(EventSpeakersRoute.name, initialChildren: children);

  static const String name = 'EventSpeakersRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i7.EventSpeakersPage();
    },
  );
}

/// generated route for
/// [_i8.FavouritesPage]
class FavouritesRoute extends _i16.PageRouteInfo<void> {
  const FavouritesRoute({List<_i16.PageRouteInfo>? children})
    : super(FavouritesRoute.name, initialChildren: children);

  static const String name = 'FavouritesRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i8.FavouritesPage();
    },
  );
}

/// generated route for
/// [_i9.GalleryPage]
class GalleryRoute extends _i16.PageRouteInfo<void> {
  const GalleryRoute({List<_i16.PageRouteInfo>? children})
    : super(GalleryRoute.name, initialChildren: children);

  static const String name = 'GalleryRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i9.GalleryPage();
    },
  );
}

/// generated route for
/// [_i10.MainPage]
class MainRoute extends _i16.PageRouteInfo<void> {
  const MainRoute({List<_i16.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i10.MainPage();
    },
  );
}

/// generated route for
/// [_i11.ProfilePage]
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute({List<_i16.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i11.ProfilePage();
    },
  );
}

/// generated route for
/// [_i12.ProgramItemFullHeroPage]
class ProgramItemFullHeroRoute
    extends _i16.PageRouteInfo<ProgramItemFullHeroRouteArgs> {
  ProgramItemFullHeroRoute({
    _i17.Key? key,
    required _i20.ScheduleEvent presentation,
    required _i17.VoidCallback onTap,
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

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProgramItemFullHeroRouteArgs>();
      return _i12.ProgramItemFullHeroPage(
        key: args.key,
        presentation: args.presentation,
        onTap: args.onTap,
        showBody: args.showBody,
        showLoveButton: args.showLoveButton,
        showDayName: args.showDayName,
      );
    },
  );
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

  final _i17.VoidCallback onTap;

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
    : super(RegistrationDetailsRoute.name, initialChildren: children);

  static const String name = 'RegistrationDetailsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i13.RegistrationDetailsPage();
    },
  );
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
         args: ScheduleEventListArgs(scheduleDay: scheduleDay, key: key),
         initialChildren: children,
       );

  static const String name = 'ScheduleEventList';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ScheduleEventListArgs>();
      return _i14.ScheduleEventList(args.scheduleDay, key: args.key);
    },
  );
}

class ScheduleEventListArgs {
  const ScheduleEventListArgs({required this.scheduleDay, this.key});

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
    : super(SponsorsRoute.name, initialChildren: children);

  static const String name = 'SponsorsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i15.SponsorsPage();
    },
  );
}
