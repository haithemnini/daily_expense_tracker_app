import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_result.freezed.dart';

@Freezed()
abstract class AppResult<T> with _$AppResult<T> {
  const factory AppResult.success(T data) = Success<T>;
  const factory AppResult.failure(String message) = Failure<T>;
}
