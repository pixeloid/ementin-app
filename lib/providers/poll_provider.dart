import 'dart:convert';

import 'package:eventapp/app_define/app_config.dart';
import 'package:eventapp/models/poll_model.dart';
import 'package:eventapp/models/poll_session_model.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:mercure_client/mercure_client.dart';

import '../data/repository/poll_repository.dart';

class PollProvider with ChangeNotifier {
  PollModel? poll;
  late final PollRepository _pollRepository;
  late final EventProvider? _eventProvider;
  PollProvider(this._pollRepository, this._eventProvider);
  subscribe() async {
    final Mercure mercure = Mercure(
      url: AppConfig.shared.env!.websocketEndpoint, // your mercure hub url
      topics: [
        'http://${_eventProvider?.selectedEvent!.domain}.ms.test:8095/api/poll_sessions/{id}'
      ], // your mercure topics
      //   token: 'your_jwt_token', // Bearer authorization
      //     lastEventId: 'last_event_id', // in case your stored last recieved event
    );

    mercure.listen((event) {
      final data = json.decode(event.data);
      final pollSession = PollSessionModel.fromJson(data);
      poll = pollSession.closed ? null : pollSession.poll;
      notifyListeners();
    });
  }

  PollOptionModel? get selected {
    return poll!.pollOptions.firstWhereOrNull((opt) => opt.selected);
  }

  PollOptionModel? get answered {
    return poll!.pollOptions.firstWhereOrNull((opt) => opt.answered);
  }

  set selected(PollOptionModel? option) {
    for (var opt in poll!.pollOptions) {
      opt.selected = opt == option;
    }
    notifyListeners();
  }

  sendResponse() async {
    await _pollRepository.sendResponse(selected!.iri);
  }

  getPollSession() async {
    final result = await _pollRepository.getPollSession();
    if (result['hydra:member'].length > 0) {
      final pollSession =
          PollSessionModel.fromJson(result['hydra:member'].first);
      poll = pollSession.poll;
      notifyListeners();
    }
  }

  reset() {
    poll = null;
    notifyListeners();
  }
}
