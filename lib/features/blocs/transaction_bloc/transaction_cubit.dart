import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enum/enum.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/models/transaction_model.dart';
import '../../transaction/data/repository/transaction_base_repository.dart';

part 'transaction_cubit.freezed.dart';
part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final TransactionBaseRepository _transactionRepository;

  TransactionCubit({required TransactionBaseRepository transactionRepository})
      : _transactionRepository = transactionRepository,
        super(const TransactionState.initial());

  Transaction _transaction = Transaction.empty();
  set transaction(Transaction value) => _transaction = value;

  bool _isEditing = false;
  set isEditing(bool value) => _isEditing = value;

  final TextEditingController _amountController = TextEditingController();
  TextEditingController get amountController => _amountController;

  void init() {
    if (_isEditing) {
      _amountController.text = _transaction.amount.toCurrencyString();
    } else {
      _amountController.clear();
      _transaction = Transaction.empty();
    }
    emit(_buildState());
  }

  void onCategorysChanged(Categorys categorys) {
    _transaction = _transaction.copyWith(categorysIndex: categorys.index);
    emit(_buildState());
  }

  void onTransactionCategoryChanged(Category category) {
    _transaction = _transaction.copyWith(category: category);
    emit(_buildState());
  }

  void onTransactionDateChanged(DateTime date) {
    _transaction = _transaction.copyWith(date: date);
    emit(_buildState());
  }

  void addOrUpdateTransaction() {
    debugPrint(_transaction.toString());

    emit(const TransactionState.loading());

    final amount = _amountController.text.isNotEmpty
        ? _amountController.text.toUnFormattedString().toDouble()
        : null;

    final transactionUpdated = _transaction.copyWith(amount: amount ?? 0.0);

    Future.delayed(const Duration(milliseconds: 300)).then((_) {
      try {
        if (_isEditing) {
          _transactionRepository.updateTransaction(transactionUpdated);
          emit(const TransactionState.success('Transaction updated success'));
        } else {
          _transactionRepository.addTransaction(transactionUpdated);
          emit(const TransactionState.success('Transaction added success'));
        }
      } catch (error) {
        debugPrint('error: $error');
        emit(TransactionState.error(error.toString()));
      }
    });
  }

  void deleteTransaction(String transactionId) async {
    emit(const TransactionState.loading());

    Future.delayed(const Duration(milliseconds: 300)).then((_) {
      try {
        _transactionRepository.deleteTransaction(transactionId);
        emit(const TransactionState.success('Transaction deleted success'));
      } catch (error) {
        debugPrint('error: $error');
        emit(TransactionState.error(error.toString()));
      }
    });
  }

  TransactionState _buildState() {
    return TransactionState.loadTransaction(
      categorys: Categorys.fromIndex(_transaction.categorysIndex),
      transactionCategory: _transaction.category,
      transactionDate: _transaction.date,
    );
  }

  @override
  Future<void> close() {
    _isEditing = false;
    _amountController.dispose();
    return super.close();
  }
}
