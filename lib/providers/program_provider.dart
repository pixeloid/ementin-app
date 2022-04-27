import 'package:eventapp/data/api/request/program_request.dart';
import 'package:eventapp/models/program_model.dart';
import '../utils/other/notifier_safety.dart';

class ProgramProvider extends ChangeNotifierSafety {
  ProgramProvider(this._programRequest);

  late final ProgramRequest _programRequest;

  List<ProgramSectionModel> _programSections = [];

  List<ProgramSectionModel> get programSections => _programSections;

  get numItems => _programSections.length;

  get numLikes => 0; //_program.where((program) => program.isLiked).length;

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
  Future<void> getProgram(String eventId) async {
    final result = await _programRequest.getProgram(eventId);
    programSections = result;
    isLoading = false;
  }

  @override
  void resetState() {
    _isLoading = false;
    _programSections = [];
  }

  void toggleLike(id) {
    final programPresentation = findPresentationById(id);

    programPresentation.toggleLike();
    notifyListeners();
  }

  ProgramPresentationModel findPresentationById(id) {
    return _programSections
        .expand((programSection) => programSection.presentations)
        .toList()
        .firstWhere((element) => element.id == id);
  }
}
