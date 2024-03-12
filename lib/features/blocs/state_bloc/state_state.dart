part of 'state_cubit.dart';

@freezed
class StateState with _$StateState {
  const factory StateState.initial() = _Initial;
  const factory StateState.loading() = Loading;

  const factory StateState.loaded(
    List<Transaction> transactions,
    Map<DateTime, double> chartData,
  ) = Loaded;

  const factory StateState.dateChanged(
    DateTime startDate,
    DateTime endDate,
  ) = DateChanged;
  const factory StateState.error(String message) = Error;
}
