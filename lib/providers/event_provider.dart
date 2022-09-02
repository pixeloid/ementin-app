import 'dart:async';

import 'package:eventapp/data/api/repository/event_repository.dart';

import '../models/event_model.dart';
import '../utils/other/notifier_safety.dart';

class EventProvider extends ChangeNotifierSafety {
  EventProvider(this._eventRepository);

  late final EventRepository _eventRepository;

  List<EventModel> _events = [];

  int? _selectedEventId;

  List<EventModel> get events => _events;
  List<DateTime> get eventDays =>
      getDaysInBetween(selectedEvent!.startDate, selectedEvent!.endDate);

  set events(List<EventModel> value) {
    _events = value;
  }

  EventModel? get selectedEvent {
    return _events.firstWhere((event) => event.id == _selectedEventId);
  }

  set selectedEventId(int? id) {
    _selectedEventId = id;
    notifyListeners();
  }

  /// Loading state
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
  }

  /// Get Tickets
  Future getEvents() async {
    events = await _eventRepository.getEvents();
    isLoading = false;
    notifyListeners();
  }

  @override
  void resetState() {
    _isLoading = false;
    _events = [];
    _selectedEventId = null;
    notifyListeners();
  }

  getById(String id) {
    return events.firstWhere((element) => element.iri == id);
  }

  checkIn(String code) async {
    try {
      await _eventRepository.checkIn(selectedEvent!.id, code);

      selectedEvent?.checkedIn = true;
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
