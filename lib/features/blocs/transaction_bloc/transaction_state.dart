part of 'transaction_cubit.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = _Initial;
  const factory TransactionState.loading() = Loading;
  const factory TransactionState.success(String message) = Success;
  const factory TransactionState.error(String message) = Error;
  const factory TransactionState.loadTransaction({
    required Categorys categorys,
    required DateTime transactionDate,
    required Category transactionCategory,
  }) = LoadTransaction;
}
