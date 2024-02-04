import '../../../../core/utils/typedef/typedef.dart';

abstract class HomeBaseRepository {
  TransactionsAllStreamResult getAllTransactionsStream();
  TotalsTransactionsStreamResult getTotalsTransactionsStream();
  TransactionAllResult getAllTransactions();
  TotalsTransactionsResult getTotalsTransactions();
  // Stream<TotalsTransactionModel> getStreamTotalsWithFirestore();
  // getStreamTotalsWithHive();
  // Future<void> addTransaction(TotalsTransactionModel totalsTransactionModel);
  // Future<void> updateTransaction(TotalsTransactionModel totalsTransactionModel);
  // Future<void> deleteTransaction(String totalsTransactionModelId);
  // Future<TotalsTransactionModel> getTransaction(String totalsTransactionModelId);
  // Future<void> deleteAllTransactions();
  // Future<void> updateTotalsTransaction(TotalsTransactionModel totalsTransactionModel);
  // Future<void> addTotalsTransaction(TotalsTransactionModel totalsTransactionModel);
}
