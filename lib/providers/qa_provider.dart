import 'dart:convert';

import 'package:eventapp/app_define/app_config.dart';
import 'package:eventapp/data/api/repository/qa_repository.dart';
import 'package:eventapp/models/poll_session_model.dart';
import 'package:eventapp/models/qa/qa_entry.dart';
import 'package:eventapp/models/qa/qa_session_model.dart';
import 'package:eventapp/services/locator.dart';
import 'package:flutter/widgets.dart';
import 'package:mercure_client/mercure_client.dart';

class QAProvider with ChangeNotifier {
  QASessionModel? qaSession;

  QARepository qaRepository = getIt.get<QARepository>();

  int? _id;

  subscribe() async {
    final Mercure mercure = Mercure(
      url: AppConfig.shared.env!.websocketEndpoint, // your mercure hub url
      topics: [
        'http://meta2022.ms.test:8095/api/q_a_entries/{id}',
      ],
    );

    mercure.listen((event) async {
      await refreshQaSession();
      notifyListeners();
    });
  }

  getQASession(int id) async {
    _id = id;

    await refreshQaSession();
    subscribe();
    notifyListeners();
  }

  reset() {
    qaSession = null;
    notifyListeners();
  }

  postQuestion(String text) async {
    final result = await qaRepository.postQuestion(text, qaSession!.iri);

    final entry = QaEntry.fromMap(result);

    qaSession!.qAEntries!.add(entry);

    notifyListeners();
  }

  Future<void> refreshQaSession() async {
    final result = await qaRepository.getQASession(_id!);
    qaSession = QASessionModel.fromMap(result);
  }
}
