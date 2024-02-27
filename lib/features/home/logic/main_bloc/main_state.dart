part of 'main_cubit.dart';

@freezed
class MainState with _$MainState {
  const factory MainState.initial() = _Initial;
  const factory MainState.loading() = Loading;
  const factory MainState.loaded(List<Transaction> transactions) = Loaded;
  const factory MainState.loadedTotals(
    TotalsTransaction totalsTransactions,
  ) = LoadedTotals;
  const factory MainState.error(String message) = Error;
}
