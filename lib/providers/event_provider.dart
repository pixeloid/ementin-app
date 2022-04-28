import 'package:eventapp/data/api/request/event_request.dart';

import '../models/event_model.dart';
import '../utils/other/notifier_safety.dart';

class EventProvider extends ChangeNotifierSafety {
  EventProvider(this._eventRequest);

  late final EventRequest _eventRequest;

  List<EventModel> _events = [];
  EventModel? _selectedEvent;

  List<EventModel> get events => _events;

  set events(List<EventModel> value) {
    _events = value;
    notifyListeners();
  }

  set selectedEvent(EventModel? event) {
    _selectedEvent = event;
    notifyListeners();
  }

  EventModel? get selectedEvent => _selectedEvent;

  /// Loading state
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Get Tickets
  Future<void> getEvents() async {
    final result = await _eventRequest.getEvents();
    events = result;
    isLoading = false;
  }

  @override
  void resetState() {
    _isLoading = false;
    _events = [];
  }

  getById(String id) {
    return events.firstWhere((element) => element.id == id);
  }
}
