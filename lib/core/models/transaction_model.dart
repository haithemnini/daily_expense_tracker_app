import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/enum.dart';
import 'transaction_hive_model.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String? uuid,
    required String? userId,
    required double amount,
    required DateTime date,
    required int categorysIndex,
    required TransactionCategory transactionCategory,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  factory Transaction.empty() {
    return Transaction(
      uuid: '',
      userId: '',
      amount: 0.0,
      date: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
      categorysIndex: 0,
      transactionCategory: TransactionCategory.expense,
    );
  }

  factory Transaction.initial() {
    return Transaction(
      uuid: '',
      userId: '',
      amount: 0.0,
      date: DateTime.now(),
      categorysIndex: 0,
      transactionCategory: TransactionCategory.expense,
    );
  }

  factory Transaction.fromHiveModel(TransactionHive transactionHive) {
    return Transaction(
      uuid: transactionHive.uuid,
      userId: transactionHive.userId,
      amount: transactionHive.amount,
      date: transactionHive.date,
      categorysIndex: transactionHive.categorysIndex,
      transactionCategory:
          transactionHive.transactionCategory == TransactionCategoryHive.expense
              ? TransactionCategory.expense
              : TransactionCategory.income,
    );
  }
}

extension TransactionExtension on Transaction {
  TransactionHive toHiveModel() {
    return TransactionHive(
      uuid: uuid!,
      userId: userId ?? '',
      amount: amount,
      date: date,
      categorysIndex: categorysIndex,
      transactionCategory: transactionCategory == TransactionCategory.expense
          ? TransactionCategoryHive.expense
          : TransactionCategoryHive.income,
    );
  }
}
