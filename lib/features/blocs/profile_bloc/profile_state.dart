part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.success(String message) = Success;
  const factory ProfileState.error(String message) = Error;
}
