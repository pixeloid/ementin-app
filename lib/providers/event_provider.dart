import 'package:eventapp/data/api/request/event_request.dart';

import '../models/event_model.dart';
import '../utils/other/notifier_safety.dart';

class EventProvider extends ChangeNotifierSafety {
  EventProvider(this._eventRequest);

  late final EventRequest _eventRequest;

  List<EventModel?>? _events;

  List<EventModel?>? get events => _events;
  set events(List<EventModel?>? value) {
    _events = value;
    notifyListeners();
  }

  String _selectedEvent = '';

  set selectedEvent(String id) {
    _selectedEvent = id;
    notifyListeners();
  }

  String get selectedEvent => _selectedEvent;

  /// Loading state
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// No more data
  bool isNoMoreData = false;

  /// Seek forwards from start of list if tickets.
  int seekForwardsCount = 7;

  /// Seek backwards from end of list if tickets.
  int seekBackwardsCount = 0;

  /// Get Tickets
  Future<void> getEvents() async {
    final result = await _eventRequest.getEvents(
        first: seekForwardsCount, skip: seekBackwardsCount);
    events ??= <EventModel>[];
    events?.addAll(result);
    isNoMoreData = result.isEmpty;
    seekBackwardsCount += 7;
    isLoading = false;
  }

  @override
  void resetState() {
    seekForwardsCount = 7;
    seekBackwardsCount = 0;
    _isLoading = false;
    isNoMoreData = false;
    _events = null;
  }

  getById(String id) {
    return events?.firstWhere((element) => element?.id == id);
  }
}
