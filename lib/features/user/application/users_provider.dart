import 'package:eventapp/features/user/domain/user_model.dart';
import 'package:eventapp/features/user/infrastructure/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../event/application/event_provider.dart';

class CheckedInUsersNotifier extends StateNotifier<List<UserModel>> {
  final Ref ref;
  CheckedInUsersNotifier({required this.ref}) : super([]);

  Future<void> getCheckedInUsers() async {
    final event = ref.read(currentEventProvider);
    final bool checkedIn = event?.checkedIn ?? false;
    if (checkedIn) {
      state = await ref.read(userRepositoryProvider).getCheckedInUsers(event!);
    }
  }
}

final checkedInUsersProvider =
    StateNotifierProvider<CheckedInUsersNotifier, List<UserModel>>(
        (ref) => CheckedInUsersNotifier(ref: ref));
