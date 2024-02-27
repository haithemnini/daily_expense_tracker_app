part of 'auth_profile_cubit.dart';

enum AuthStatus { authenticated, unauthenticated, unknown }

@freezed
class AuthProfileState with _$AuthProfileState {
  const factory AuthProfileState.initial() = _Initial;
  const factory AuthProfileState.authChanged({
    required AuthStatus authStatus,
    User? user,
  }) = AuthChanged;
  const factory AuthProfileState.loading() = Loading;
  const factory AuthProfileState.loaded(User user) = Loaded;
  const factory AuthProfileState.error(String message) = Error;
}
