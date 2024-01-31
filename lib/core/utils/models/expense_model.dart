import '../../enum/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

@freezed
class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel({
    required String? userId,
    required String title,
    required String description,
    required double amount,
    required DateTime date,
    required int categoryIndex,
    required ExpenseType expenseType,
    required,
  }) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);

  factory ExpenseModel.empty() {
    return ExpenseModel(
      userId: '',
      title: '',
      description: '',
      amount: 0.0,
      date: DateTime.now(),
      categoryIndex: 0,
      expenseType: ExpenseType.expense,
    );
  }

  factory ExpenseModel.fromTransaction(Transaction transaction) {
    return ExpenseModel(
      userId: '',
      title: '',
      description: '',
      amount: 0.0,
      date: DateTime.now(),
      categoryIndex: 0,
      expenseType: transaction == Transaction.addExpense ||
              transaction == Transaction.editExpense
          ? ExpenseType.expense
          : ExpenseType.income,
    );
  }
}
