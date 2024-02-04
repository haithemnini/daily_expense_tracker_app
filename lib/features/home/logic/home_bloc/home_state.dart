part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.loaded(List<TransactionModel> transactions) = Loaded;
  const factory HomeState.loadedTotals(
    TotalsTransactionModel totalsTransactions,
  ) = LoadedTotals;
  const factory HomeState.error(String message) = Error;
}
