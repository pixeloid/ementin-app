import 'dart:convert';

import 'package:eventapp/data/api/request/program_request.dart';
import 'package:eventapp/models/program_model.dart';
import '../app_define/app_config.dart';
import '../data/api/auth_http_client.dart';
import '../utils/other/notifier_safety.dart';

class ProgramProvider extends ChangeNotifierSafety {
  ProgramProvider(this._programRequest);

  late final ProgramRequest _programRequest;

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

  Future<void> toggleLike(id) async {
    final programPresentation = findPresentationById(id);
    final oldLike = programPresentation.isLiked;
    programPresentation.toggleLike();
    notifyListeners();

    final client = AuthenticatedHttpClient();
    final response;
    try {
      if (oldLike != null) {
        response = await client.delete(
          Uri.parse(AppConfig.shared.env!.restEndPoint +
              '/presentation_favorites/$oldLike'),
          headers: {"Content-Type": "application/json"},
        );
      } else {
        response = await client.post(
          Uri.parse(
              AppConfig.shared.env!.restEndPoint + '/presentation_favorites'),
          headers: {"Content-Type": "application/json"},
          body: json.encode(
            {
              'presentation': programPresentation.id,
            },
          ),
        );

        final responseData = json.decode(response.body);

        programPresentation.isLiked = responseData['id'];
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
