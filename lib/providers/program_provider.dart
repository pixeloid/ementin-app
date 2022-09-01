import 'dart:convert';

import 'package:eventapp/data/api/repository/program_repository.dart';
import 'package:eventapp/models/program_item_model.dart';
import '../models/program_presentation_rate_model.dart';
import '../utils/other/notifier_safety.dart';
import 'package:collection/collection.dart';

class ProgramProvider extends ChangeNotifierSafety {
  ProgramProvider(this._programRepository);

  late final ProgramRepository _programRepository;

  List<ProgramItemModel> _programItems = [];

  List<ProgramItemModel> get programItems => _programItems;

  get numItems => _programItems.length;

  get favourites {
    var result = [];
    for (var item in _programItems) {
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

  set programItems(List<ProgramItemModel> value) {
    _programItems = value;
    notifyListeners();
  }

  /// Loading state
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  ProgramItemModel get activeProgram => _programItems[2];

  /// Get Tickets
  Future<void> getProgram(int eventId, {DateTime? date}) async {
    final result = await _programRepository.getProgram(eventId, date);
    programItems = result;
    isLoading = false;
  }

  @override
  void resetState() {
    _isLoading = false;
    _programItems = [];
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
    ProgramItemModel? item = _programItems.firstWhereOrNull(
        (ProgramItemModel element) =>
            element.id == programItem.id && element.type == programItem.type);

    if (item != null) return item;
    item = _programItems
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
}
