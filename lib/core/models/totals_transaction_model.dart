import 'package:freezed_annotation/freezed_annotation.dart';

part 'totals_transaction_model.freezed.dart';

@freezed
class TotalsTransactionModel with _$TotalsTransactionModel {
  const factory TotalsTransactionModel({
    required double totalIncome,
    required double totalExpense,
    required double totalBalance,
  }) = _TotalsTransactionModel;
}
