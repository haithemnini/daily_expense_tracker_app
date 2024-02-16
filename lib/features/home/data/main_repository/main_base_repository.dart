import '../../../../core/models/totals_transaction_model.dart';
import '../../../../core/models/transaction_model.dart';
import '../../../../core/utils/models/app_result.dart';

abstract class MainBaseRepository {
  Stream<List<Transaction>> getAllStream();
  Stream<TotalsTransaction> getTotalsStream();
  Future<AppResult<List<Transaction>>> getAll();
  Future<AppResult<TotalsTransaction>> getTotals();
  // Stream<TotalsTransactionModel> getStreamTotalsWithFirestore();
  // getStreamTotalsWithHive();
  // Future<void> addTransaction(TotalsTransactionModel totalsTransactionModel);
  // Future<void> updateTransaction(TotalsTransactionModel totalsTransactionModel);
  // Future<void> deleteTransaction(String totalsTransactionModelId);
  // Future<TotalsTransactionModel> getTransaction(String totalsTransactionModelId);
  // Future<void> deleteAllTransactions();
  // Future<void> updateTotalsTransaction(TotalsTransactionModel totalsTransactionModel);
  // Future<void> addTotalsTransaction(TotalsTransactionModel totalsTransactionModel);

  void dispose();
}
