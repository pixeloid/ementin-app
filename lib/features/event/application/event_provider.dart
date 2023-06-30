import 'dart:math';

import 'package:collection/collection.dart';
import 'package:eventapp/features/event/infrastructure/event_repository.dart';
import 'package:eventapp/features/event/domain/event_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/helpers.dart';
import '../../../utils/extension/app_extension.dart';
import '../../auth/application/auth_provider.dart';

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

final eventListProvider =
    StateNotifierProvider<EventsNotifier, List<EventModel>>((ref) {
  return EventsNotifier(ref: ref);
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
