import 'dart:math';

import 'package:eventapp/features/event/infrastructure/event_repository.dart';
import 'package:eventapp/features/event/domain/event_model.dart';
import 'package:eventapp/features/program/domain/program_item_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/helpers.dart';
import '../../../utils/extension/app_extension.dart';

class EventsNotifier extends StateNotifier<List<EventModel>> {
  final Ref ref;
  EventsNotifier({required this.ref}) : super([]);

  Future<void> getEvents() async {
    await ref.read(eventRepositoryProvider).getEvents().then((value) {
      state = value;
    });
  }
}

final eventListProvider =
    StateNotifierProvider<EventsNotifier, List<EventModel>>((ref) {
  return EventsNotifier(ref: ref);
});

class CurrentEventNotifier extends StateNotifier<EventModel?> {
  final Ref ref;

  CurrentEventNotifier({required this.ref}) : super(null);

  void setCurrentEvent(int id) {
    state = ref.watch(eventListProvider).firstWhere((event) => event.id == id);
  }
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
        .watch(eventDaysListProvider)
        .indexWhere((element) => element.isDateEqual(DateTime.now().toUtc())),
    0));
