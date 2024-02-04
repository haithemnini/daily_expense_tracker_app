import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/enum.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required String? userId,
    required String title,
    required String description,
    required double amount,
    required DateTime date,
    required int categoryIndex,
    required TransactionType transactionType,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  // factory TransactionModel.empty() {
  //   return TransactionModel(
  //     userId: '',
  //     title: '',
  //     description: '',
  //     amount: 0.0,
  //     date: DateTime.now(),
  //     categoryIndex: 0,
  //     transactionType: TransactionType.expense,
  //   );
  // }

  // factory TransactionModel.fromTransaction(Transaction transaction) {
  //   return TransactionModel(
  //     userId: '',
  //     title: '',
  //     description: '',
  //     amount: 0.0,
  //     date: DateTime.now(),
  //     categoryIndex: 0,
  //     transactionType: transaction == Transaction.addExpense ||
  //             transaction == Transaction.editExpense
  //         ? TransactionType.expense
  //         : TransactionType.income,
  //   );
  // }
}
