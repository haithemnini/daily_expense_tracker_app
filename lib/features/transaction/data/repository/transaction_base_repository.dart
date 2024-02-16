import '../../../../core/models/transaction_model.dart';
import '../../../../core/utils/models/app_result.dart';

abstract class TransactionBaseRepository {
  Future<AppResult<void>> addTransaction(Transaction transaction);
  Future<AppResult<void>> updateTransaction(Transaction transaction);
  Future<AppResult<void>> deleteTransaction(String transactionId);
}
