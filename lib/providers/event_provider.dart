import 'dart:async';
import 'dart:math';

import 'package:eventapp/data/api/repository/event_repository.dart';

import '../models/event_model.dart';
import '../utils/other/notifier_safety.dart';

class EventProvider extends ChangeNotifierSafety {
  EventProvider(this._eventRepository);

  late final EventRepository _eventRepository;

  List<EventModel> events = [];

  int? _selectedEventId;
  List<DateTime> get eventDays =>
      getDaysInBetween(selectedEvent!.startDate, selectedEvent!.endDate);

  EventModel? get selectedEvent {
    return events.firstWhere((event) => event.id == _selectedEventId);
  }

  get currentDayIndex => max(
      eventDays
          .indexWhere((element) => element.isDateEqual(DateTime.now().toUtc())),
      0);

  int get currentSectionIndex => 0;

  set selectedEventId(int? id) {
    _selectedEventId = id;
    notifyListeners();
  }

  /// Loading state
  bool isLoading = false;

  /// Get Tickets
  Future getEvents() async {
    events = await _eventRepository.getEvents();
    isLoading = false;
    notifyListeners();
  }

  @override
  void resetState() {
    isLoading = false;
    events = [];
    _selectedEventId = null;
    notifyListeners();
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
