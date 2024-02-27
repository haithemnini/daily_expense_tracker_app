import 'package:bloc/bloc.dart';
import '../../../../core/enum/enum.dart';
import '../../../../core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/transaction_model.dart';
import '../../data/repository/transaction_base_repository.dart';

part 'transaction_state.dart';
part 'transaction_cubit.freezed.dart';

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
      _amountController.text = _transaction.amount.toFormattedCurrencyString();
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

  void onTransactionCategoryChanged(TransactionCategory transactionCategory) {
    _transaction = _transaction.copyWith(
      transactionCategory: transactionCategory,
    );
    emit(_buildState());
  }

  void onTransactionDateChanged(DateTime date) {
    _transaction = _transaction.copyWith(date: date);
    emit(_buildState());
  }

  void addOrUpdateTransaction() {
    emit(const TransactionState.loading());

    final amount = _amountController.text.isNotEmpty
        ? _amountController.text.toUnFormattedString().toDouble()
        : null;

    final transactionUpdated = _transaction.copyWith(amount: amount ?? 0.0);

    Future.delayed(const Duration(milliseconds: 300)).then((_) {
      try {
        if (_isEditing) {
          _transactionRepository.updateTransaction(transactionUpdated).then(
                (value) => {
                  value.when(
                    success: (_) {
                      emit(const TransactionState.success(
                        'Transaction updated success',
                      ));
                    },
                    failure: (message) {
                      emit(TransactionState.error(message));
                    },
                  ),
                },
              );
        } else {
          _transactionRepository.addTransaction(transactionUpdated).then(
                (value) => {
                  value.when(
                    success: (_) {
                      emit(const TransactionState.success(
                        'Transaction added success',
                      ));
                    },
                    failure: (message) {
                      emit(TransactionState.error(message));
                    },
                  ),
                },
              );
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
        _transactionRepository.deleteTransaction(transactionId).then(
              (value) => {
                value.when(
                  success: (_) {
                    emit(const TransactionState.success(
                      'Transaction deleted success',
                    ));
                  },
                  failure: (message) {
                    emit(TransactionState.error(message));
                  },
                ),
              },
            );
      } catch (error) {
        debugPrint('error: $error');
        emit(TransactionState.error(error.toString()));
      }
    });
  }

  TransactionState _buildState() {
    return TransactionState.loadTransaction(
      categorys: Categorys.fromIndex(_transaction.categorysIndex),
      transactionCategory: _transaction.transactionCategory,
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
