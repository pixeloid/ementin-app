import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isBusy,
    @Default(false) bool isLoggedIn,
    Map? data,
    String? errorMessage,
  }) = _Auth0State;
}
