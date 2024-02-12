import '../../../../core/models/transaction_model.dart';

abstract class TransactionBaseRepository {
  Future<String> addTransaction(TransactionModel transactionModel);
  Future<void> updateTransaction(String transactionId);
  Future<void> deleteTransaction(String transactionId);
}
