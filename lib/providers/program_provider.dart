import 'dart:convert';
import 'package:eventapp/app_define/app_config.dart';
import 'package:eventapp/data/api/repository/program_repository.dart';
import 'package:eventapp/data/api/shared_preference_helper.dart';
import 'package:eventapp/models/program_item_model.dart';
import 'package:eventapp/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:mercure_client/mercure_client.dart';
import '../models/program_presentation_rate_model.dart';
import '../utils/other/notifier_safety.dart';
import 'package:collection/collection.dart';

class ProgramProvider extends ChangeNotifierSafety {
  final ProgramRepository _programRepository = getIt<ProgramRepository>();

  List<ProgramItemModel> programItems = [];

  get numItems => programItems.length;

  get favourites {
    var result = [];
    for (var item in programItems) {
      if (item.isLiked != null) result.add(item);

      var prezik = item.children
          .where((presentation) => presentation.isLiked != null)
          .toList();
      for (var prezi in prezik) {
        result.add(prezi);
      }
    }
    return result;
  }

  /// Loading state
  bool isLoading = false;

  get inProgress => programItems.indexWhere((element) {
        final now = DateTime.now().toUtc().add(const Duration(hours: 2));
        return element.start.isBefore(now) && element.end.isAfter(now);
      });

  subscribe() async {
    final Mercure mercure = Mercure(
      url: AppConfig.shared.env!.websocketEndpoint, // your mercure hub url
      topics: [
        'http://meta2022.ms.test:8095/api/presentations/{id}',
        'http://meta2022.ms.test:8095/api/presentation_sections/{id}',
      ], // your mercure topics
      token: getIt.get<SharedPreferenceHelper>().getUserToken(),
      //     lastEventId: 'last_event_id', // in case your stored last recieved event
    );

    mercure.listen((event) {
      notifyListeners();
    });
  }

  /// Get Tickets
  Future<void> getProgram(int eventId, {DateTime? date}) async {
    final result = await _programRepository.getProgram(eventId, date);
    programItems = result;
    isLoading = false;
    subscribe();
    notifyListeners();
  }

  @override
  void resetState() {
    isLoading = false;
    programItems = [];
  }

  Future<void> toggleLike(ProgramItemModel presentation) async {
    var programPresentation = findPresentation(presentation);
    if (programPresentation == null) return;

    var oldLike = programPresentation.isLiked;
    programPresentation.toggleLike();
    notifyListeners();

    try {
      if (oldLike != null) {
        await _programRepository.removeLike(oldLike);
      } else {
        final response = await _programRepository.like(programPresentation.iri);

        final responseData = json.decode(response);

        programPresentation.isLiked = responseData['@id'];
      }
    } catch (error) {
      error;
    }
  }

  ProgramItemModel? findPresentation(ProgramItemModel programItem) {
    ProgramItemModel? item = programItems.firstWhereOrNull(
        (ProgramItemModel element) =>
            element.id == programItem.id && element.type == programItem.type);

    if (item != null) return item;
    item = programItems
        .expand((programItem) => programItem.children)
        .toList()
        .firstWhereOrNull((element) =>
            element.id == programItem.id && element.type == programItem.type);

    return item;
  }

  rate(ProgramItemModel program, double val) async {
    var programPresentation = findPresentation(program);

    if (programPresentation == null) return null;

    final prevRate = programPresentation.rateValue;

    try {
      programPresentation.rateValue = val;
      notifyListeners();

      final rateJson = (programPresentation.rate == null)
          ? await _programRepository.addRate(val, programPresentation)
          : await _programRepository.updateRate(val, programPresentation);
      programPresentation.rate =
          ProgramPresentationRateModel.fromJson(rateJson);
    } catch (error) {
      programPresentation.rateValue = prevRate;
    }
  }

  List<ProgramItemModel> getProgramForDay(DateTime day) {
    return programItems
        .where((element) => DateUtils.isSameDay(day, element.start))
        .toList();
  }
}
