import 'package:eventapp/data/api/request/program_request.dart';
import 'package:eventapp/models/program_model.dart';
import '../utils/other/notifier_safety.dart';

class ProgramProvider extends ChangeNotifierSafety {
  ProgramProvider(this._programRequest);

  late final ProgramRequest _programRequest;

  List<SectionModel> _program = [];

  List<SectionModel> get program => _program;

  get numItems => _program.length;

  get numLikes => 0; //_program.where((program) => program.isLiked).length;

  set program(List<SectionModel> value) {
    _program = value;
    notifyListeners();
  }

  /// Loading state
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  ProgramSectionModel get activeProgram => _program[2];

  /// Get Tickets
  Future<void> getProgram(String eventId) async {
    final result = await _programRequest.getProgram(eventId);
    program = result;
    isLoading = false;
  }

  @override
  void resetState() {
    _isLoading = false;
    _program = [];
  }

  void toggleLike(ProgramSectionModel program) {
    program.toggleLike();
    notifyListeners();
  }
}
