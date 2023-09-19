import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:eventapp/app_define/app_config.dart';
import 'package:eventapp/data/repository/program_repository.dart';
import 'package:eventapp/models/author/author.dart';
import 'package:eventapp/models/event_model.dart';
import 'package:eventapp/models/program_item_model.dart';
import 'package:eventapp/models/schedule_model.dart';
import 'package:eventapp/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:mercure_client/mercure_client.dart';
import '../data/repository/author_repository.dart';
import '../utils/other/notifier_safety.dart';
import 'package:collection/collection.dart';

class ProgramProvider extends ChangeNotifierSafety {
  final ProgramRepository _programRepository = getIt<ProgramRepository>();
  final AuthorRepository authorRepository = getIt<AuthorRepository>();

  List<ProgramItemModel> programItems = [];
  List<Author> authors = [];
  final int minSearchTextLength = 2;
  String searchString = '';
  bool showSearch = false;
  Schedule? schedule;
  List<ScheduleEvent> flatEvents = [];

  get numItems => programItems.length;

  get favourites {
    var result = [];
    for (var item in flatEvents) {
      if (item.favourite == 1) result.add(item);
    }
    return result;
  }

  void _flattenSchedule() {
    flatEvents = [];
    for (final day in schedule!.days) {
      for (final eventGroup in day.eventGroups) {
        for (final hall in eventGroup.columns) {
          for (final event in hall.events ?? []) {
            flatEvents.add(event);
            if (event.children.isNotEmpty) {
              flatEvents.addAll(event.children);
            }
          }
        }
      }
    }
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
      //token: getIt.get<SharedPreferenceHelper>().getUserToken(),
      //     lastEventId: 'last_event_id', // in case your stored last recieved event
    );

    mercure.listen((event) {
      final ProgramItemModel newProgramItem =
          ProgramItemModel.fromJson(json.decode(event.data));

      final sectionIndex = programItems.indexWhere(
        (element) => element.id == newProgramItem.id,
      );

      if (sectionIndex != -1) {
        programItems[sectionIndex] = newProgramItem;
      } else {
        for (var section in programItems) {
          final sindex = programItems.indexOf(section);
          for (var child in section.children) {
            if (child.id == newProgramItem.id) {
              final index = section.children.indexOf(child);
              programItems[sindex].children[index] = newProgramItem;
            }
          }
        }
      }

      notifyListeners();
    });
  }

  /// Get Tickets
  Future<bool> getProgram(EventModel event, {DateTime? date}) async {
    isLoading = true;
    schedule = await _programRepository.getProgram(event, date);
    // programItems =
    authors = await authorRepository.getSpeakers(event);
    _flattenSchedule();

/*     authors = authors.map((author) {
      for (var element in author.presentations!) {
        final programItem = findPresentationByIri(element);
        if (programItem != null) {
          author.presentations.add(programItem);
        }
      }
      author.presentations.sort((a, b) => a.start.compareTo(b.start));

      return author;
    }).toList(); */

    isLoading = false;
    // subscribe();
    notifyListeners();
    return true;
  }

  @override
  void resetState() {
    isLoading = false;
    programItems = [];
  }

  void toggleFavoriteStatus(String id) async {
    var index = flatEvents.indexWhere(
      (event) => event.id == id,
    );
    if (!index.isNegative) {
      final event = flatEvents[index];
      final prev = event.favourite;

      flatEvents[index] =
          event.copyWith(favourite: event.favourite != 0 ? 0 : 1);

      notifyListeners();
//todo: handle error
      try {
        await _programRepository.toggleFavourite(event.eventId);
        debugPrint('OK');
      } on DioError catch (_) {
        flatEvents[index] = event.copyWith(favourite: prev);

        notifyListeners();
      }
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

  ScheduleEvent? findPresentationByIri(String iri) {
    ScheduleEvent? item = flatEvents
        .firstWhereOrNull((ScheduleEvent element) => element.id == iri);

    return item;
  }

  rate(String id, double val) async {
    var index = flatEvents.indexWhere(
      (event) => event.id == id,
    );
    if (!index.isNegative) {
      final event = flatEvents[index];
      final prevRate = event.rate;

      flatEvents[index] = event.copyWith(rate: val);

      notifyListeners();
      debugPrint('OK');

//todo: handle error
      try {
        await _programRepository.rate(val, event);
      } on DioError catch (_) {
        flatEvents[index] = event.copyWith(rate: prevRate);

        notifyListeners();
      }
    }
  }

  List<ProgramItemModel> getProgramForDay(DateTime day) {
    return programItems
        .where((element) => DateUtils.isSameDay(day, element.start))
        .toList();
  }

  void changeSearchString(String search) {
    if (search.length > minSearchTextLength) {
      searchString = search;
      notifyListeners();
    } else {
      if (searchString.length > search.length) {
        searchString = '';
        notifyListeners();
      }
    }
  }

  List<ProgramItemModel> findPresentationByTitle(String value) {
    return programItems
        .expand((programItem) => programItem.children)
        .toList()
        .where((element) =>
            element.title.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  List<ProgramItemModel> get filteredList {
    return searchString.length > minSearchTextLength
        ? findPresentationByTitle(searchString)
        : [];
  }

  void toggleSearch() {
    showSearch = !showSearch;
    debugPrint(showSearch.toString());
    notifyListeners();
  }
}
