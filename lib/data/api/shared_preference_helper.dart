import 'package:eventapp/data/key_value_storage_base.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SharedPreferenceHelper {
  static const String token = "token";
  static const String rfToken = "refresh_token";
  final _keyValueStorage = KeyValueStorageBase();

  Future<void> setUserToken({required String userToken}) async {
    await _keyValueStorage.setCommon(token, userToken);
  }

  Future<void> setRefreshToken({required String refreshToken}) async {
    await _keyValueStorage.setCommon(rfToken, refreshToken);
  }

  String? getUserToken() {
    return _keyValueStorage.getCommon(token);
  }

  String? getRefreshToken() {
    return _keyValueStorage.getCommon(rfToken);
  }

  void resetKeys() {
    _keyValueStorage
      ..clearCommon()
      ..clearEncrypted();
  }
}

final sharedPreferencesProvider = Provider<SharedPreferenceHelper>(
  (ref) => SharedPreferenceHelper(),
);
