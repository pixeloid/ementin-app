import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../event/application/event_provider.dart';
import '../domain/author_model.dart';
import '../infrastructure/author_repository.dart';

class SpeakersNotifier extends StateNotifier<List<AuthorModel>> {
  final Ref ref;
  SpeakersNotifier({required this.ref}) : super([]);

  Future<void> getAllSpeakers() async {
    final event = ref.read(currentEventProvider);
    final bool checkedIn = event?.checkedIn ?? false;
    if (checkedIn) {
      state = await ref.read(authorRepositoryProvider).getSpeakers(event!);
    }
  }
}

final speakersProvider =
    StateNotifierProvider<SpeakersNotifier, List<AuthorModel>>(
        (ref) => SpeakersNotifier(ref: ref));
