import 'dart:math';

import 'package:collection/collection.dart';
import 'package:eventapp/features/event/infrastructure/event_repository.dart';
import 'package:eventapp/features/event/domain/event_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/helpers.dart';
import '../../../utils/extension/app_extension.dart';
import '../../auth/application/auth_provider.dart';
import '../domain/filter_option.dart';

class EventsNotifier extends StateNotifier<List<EventModel>> {
  final Ref ref;
  EventsNotifier({required this.ref}) : super([]);

  Future<void> getEvents() async {
    await ref.read(eventRepositoryProvider).getEvents().then((value) {
      state = value;
    });
  }

  Future<dynamic> checkInAndLogin(int id, String code) async {
    final checkIn = await ref.read(eventRepositoryProvider).checkIn(id, code);
    await ref.read(authProvider.notifier).loginWithCode(code);

    return checkIn;
  }
}

final eventListKeyProvider = StateProvider<GlobalKey<AnimatedListState>?>(
    (ref) => GlobalKey<AnimatedListState>());
final selectedEventFilterProvider = StateProvider<FilterOption?>((ref) => null);

final eventListProvider =
    StateNotifierProvider<EventsNotifier, List<EventModel>>((ref) {
  return EventsNotifier(ref: ref);
});

final filteredEventListProvider = Provider<List<EventModel>>((ref) {
  final filter = ref.watch(selectedEventFilterProvider);
  final events = ref.watch(eventListProvider);
  final now = DateTime.now();
  List<EventModel> result = [];
  switch (filter?.id) {
    case 'past':
      result = events.where((event) => event.endDate.isBefore(now)).toList();
      break;
    case 'current':
      result = events
          .where((event) =>
              event.endDate.isBefore(now) && event.startDate.isAfter(now))
          .toList();
      break;
    case 'future':
      result = events.where((event) => event.startDate.isAfter(now)).toList();
      break;
    default:
      result = events;
  }

  return result;
});

final currentEventIdProvider = StateProvider<int?>((ref) => null);

class CurrentEventNotifier extends StateNotifier<EventModel?> {
  final Ref ref;

  CurrentEventNotifier({required this.ref})
      : super(ref.watch(eventListProvider).firstWhereOrNull(
              (event) => event.id == ref.watch(currentEventIdProvider),
            ));
}

final currentEventProvider =
    StateNotifierProvider<CurrentEventNotifier, EventModel?>(
        (ref) => CurrentEventNotifier(ref: ref));

final eventDaysListProvider = Provider<List<DateTime>>((ref) {
  return getDaysInBetween(ref.watch(currentEventProvider)!.startDate,
      ref.watch(currentEventProvider)!.endDate);
});

final currendDayIndexProvider = Provider<int>((ref) => max(
    ref
        .read(eventDaysListProvider)
        .indexWhere((element) => element.isDateEqual(DateTime.now().toUtc())),
    0));
