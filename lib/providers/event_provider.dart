import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:eventapp/features/event/infrastructure/event_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/event/domain/event_model.dart';
import '../utils/states/future_state.codegen.dart';

class EventProvider extends StateNotifier<FutureState<String>> {
  // EventProvider(this._eventRepository);

  late final EventRepository _eventRepository;

  List<EventModel> events = [];

  int? _selectedEventId;

  EventProvider(super.state);
  List<DateTime> get eventDays =>
      getDaysInBetween(selectedEvent!.startDate, selectedEvent!.endDate);

  EventModel? get selectedEvent {
    return events.firstWhereOrNull((event) => event.id == _selectedEventId);
  }

  get currentDayIndex => max(
      eventDays
          .indexWhere((element) => element.isDateEqual(DateTime.now().toUtc())),
      0);

  int get currentSectionIndex => 0;

  set selectedEventId(int? id) {
    _selectedEventId = id;
    //  notifyListeners();
  }

  /// Loading state
  bool isLoading = false;

  /// Get Tickets
  Future getEvents() async {
    try {
      events = await _eventRepository.getEvents();
      isLoading = false;
      //   notifyListeners();
    } catch (e) {
      //  notifyListeners();
      debugPrint(e.toString());
    }
  }

  @override
  void resetState() {
    isLoading = false;
    events = [];
    _selectedEventId = null;
    //  notifyListeners();
  }

  getById(String id) {
    return events.firstWhere((element) => element.iri == id);
  }

  checkIn(String code) async {
    try {
      final result = await _eventRepository.checkIn(selectedEvent!.id, code);

      selectedEvent?.checkedIn = true;

      return result;
    } catch (_) {
      rethrow;
    }
  }

  List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
    List<DateTime> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));
    }
    return days;
  }
}

extension CompareDates on DateTime {
  bool isDateEqual(DateTime date2) {
    return year == date2.year && month == date2.month && day == date2.day;
  }
}
