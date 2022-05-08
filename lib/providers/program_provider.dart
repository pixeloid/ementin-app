import 'dart:convert';

import 'package:eventapp/data/api/repository/program_repository.dart';
import 'package:eventapp/models/program_presentation_model.dart';
import 'package:eventapp/models/program_section_model.dart';
import '../utils/other/notifier_safety.dart';

class ProgramProvider extends ChangeNotifierSafety {
  ProgramProvider(this._programRepository);

  late final ProgramRepository _programRepository;

  List<ProgramSectionModel> _programSections = [];

  List<ProgramSectionModel> get programSections => _programSections;

  get numItems => _programSections.length;

  get favourites {
    var result = [];
    for (var section in _programSections) {
      var prezik = section.presentations
          .where((presentation) => presentation.isLiked != null)
          .toList();
      for (var prezi in prezik) {
        result.add(prezi);
      }
    }
    return result;
  }

  set programSections(List<ProgramSectionModel> value) {
    _programSections = value;
    notifyListeners();
  }

  /// Loading state
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  ProgramSectionModel get activeProgram => _programSections[2];

  /// Get Tickets
  Future<void> getProgram(int eventId) async {
    final result = await _programRepository.getProgram(eventId);
    programSections = result;
    isLoading = false;
  }

  @override
  void resetState() {
    _isLoading = false;
    _programSections = [];
  }

  Future<void> toggleLike(id) async {
    var programPresentation = findPresentationById(id);
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

  ProgramPresentationModel findPresentationById(id) {
    return _programSections
        .expand((programSection) => programSection.presentations)
        .toList()
        .firstWhere((element) => element.id == id);
  }
}
