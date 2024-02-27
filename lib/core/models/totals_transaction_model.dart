import 'transaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/transaction.dart';

part 'totals_transaction_model.freezed.dart';

@freezed
class TotalsTransaction with _$TotalsTransaction {
  const factory TotalsTransaction({
    required double totalIncome,
    required double totalExpense,
    required double totalBalance,
  }) = _TotalsTransactionModel;

  factory TotalsTransaction.calcu(List<Transaction> transactions) {
    return TotalsTransaction(
        // totalExpense = totalExpense
        totalExpense: transactions
            .where((transaction) =>
                transaction.transactionCategory == TransactionCategory.expense)
            .map((transaction) => transaction.amount)
            .fold(0.0, (prev, amount) => prev + amount),

        // totalIncome = totalIncome - totalExpense
        totalIncome: transactions
            .where((transaction) =>
                transaction.transactionCategory == TransactionCategory.income)
            .map((transaction) => transaction.amount)
            .fold(0.0, (prev, amount) => prev + amount),

        // totalBalance = totalIncome - totalExpense
        totalBalance: transactions
            .map((transaction) => transaction.amount)
            .fold(0.0, (prev, amount) => prev + amount));
  }
}
