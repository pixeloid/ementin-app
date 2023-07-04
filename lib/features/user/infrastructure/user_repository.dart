import 'package:eventapp/data/api/dio_client.dart';
import 'package:eventapp/data/endpoints.dart';
import 'package:eventapp/features/event/domain/event_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/user_model.dart';

class UserRepository {
  final DioClient netWorkLocator;

  UserRepository(this.netWorkLocator);

  Future<List<UserModel>> getCheckedInUsers(EventModel event) async {
    netWorkLocator.dio.options.extra['event'] = event.domain;
    final response = await netWorkLocator.dio.get(
      '${EndPoints.baseUrl}${EndPoints.checkedInUsers}',
    );
    return response.data['hydra:member']
        .map<UserModel>((e) => UserModel.fromJson(e))
        .toList();
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref.watch(dioClientProvider));
});
