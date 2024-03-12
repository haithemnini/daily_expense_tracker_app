part of 'auth_cubit.dart';

enum AuthStatus { authenticated, unauthenticated, unknown }

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authChanged({
    required AuthStatus authStatus,
    User? user,
  }) = AuthChanged;
  const factory AuthState.loading() = Loading;
  const factory AuthState.loaded(User user) = Loaded;
  const factory AuthState.error(String message) = Error;
}
