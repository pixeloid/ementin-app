import 'package:eventapp/data/api/request/message_request.dart';
import 'package:eventapp/models/message_model.dart';
import '../utils/other/notifier_safety.dart';

class MessageProvider extends ChangeNotifierSafety {
  MessageProvider(this._messageRequest);

  late final MessageRequest _messageRequest;

  List<MessageModel> _messages = [];

  List<MessageModel> get messages => _messages;

  get numItems => _messages.length;

  set messages(List<MessageModel> value) {
    _messages = value;
    notifyListeners();
  }

  /// Loading state
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getMessages(String eventId) async {
    final result = await _messageRequest.getMessages();
    messages = result;
    isLoading = false;
  }

  @override
  void resetState() {
    // TODO: implement resetState
  }
}
