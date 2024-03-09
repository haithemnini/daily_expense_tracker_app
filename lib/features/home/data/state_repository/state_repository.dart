import 'package:auth_user/auth_user.dart';
import 'package:db_firestore_client/db_firestore_client.dart';
import 'package:db_hive_client/db_hive_client.dart';
import 'package:flutter/material.dart';

import '../../../../core/enum/transaction.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/models/transaction_hive_model.dart';
import '../../../../core/models/transaction_model.dart';
import '../../../../core/utils/models/app_result.dart';
import 'state_base_repository.dart';

class StateRepository implements StateBaseRepository {
  final DbFirestoreClientBase _dbFirestoreClient;
  final DbHiveClientBase _dbHiveClient;
  final AuthUserBase _authUser;

  StateRepository({
    required DbFirestoreClientBase dbFirestoreClient,
    required DbHiveClientBase dbHiveClient,
    required AuthUserBase authUser,
  })  : _dbFirestoreClient = dbFirestoreClient,
        _dbHiveClient = dbHiveClient,
        _authUser = authUser;

  String get _currentUser => _authUser.currentUser!.uid;
  bool get _isUserLoggedIn => _authUser.currentUser != null;

  @override
  Future<AppResult<Map<String, dynamic>>> getState({
    required Category category,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    debugPrint('Transaction Category: $category');

    final updatedEndDate = DateTime(endDate.year, endDate.month, endDate.day);
    final updatedStartDate =
        DateTime(startDate.year, startDate.month, startDate.day);

    if (!_isUserLoggedIn) {
      // Get the transactions from the hive
      final transactions = _getHiveTransactions(
        category,
        updatedStartDate,
        updatedEndDate,
      );

      try {
        final result = await transactions;
        final map = {
          'transactions': result,
          'chartData': _generateChartData(result),
        };
        return AppResult.success(map);
      } catch (_) {
        return const AppResult.failure(
          'An error occurred while getting the transactions',
        );
      }
    }

    // Get the transactions from the firestore
    final transactions = _getFirestoreTransactions(
      category,
      updatedStartDate,
      updatedEndDate,
    );

    try {
      final result = await transactions;
      final map = {
        'transactions': result,
        'chartData': _generateChartData(result),
      };
      return AppResult.success(map);
    } catch (_) {
      return const AppResult.failure(
        'An error occurred while getting the transactions',
      );
    }
  }

  Map<DateTime, double> _generateChartData(List<Transaction> transactions) {
    final map = <DateTime, double>{};

    for (final transaction in transactions) {
      final date = transaction.date.dateOnly;
      final amount = transaction.amount;

      if (map.containsKey(date)) {
        map[date] = map[date]! + amount;
      } else {
        map[date] = amount;
      }
    }

    return map.isEmpty ? {DateTime.now(): 0.0} : map;
  }

  Future<List<Transaction>> _getHiveTransactions(
      Category category, DateTime startDate, DateTime endDate) async {
    final transactions = await _dbHiveClient.getAll<TransactionHive>(
      boxName: 'transactions',
    );

    // Filter the transactions based on the [transactionType] and date range
    final filtered = transactions
        .where((element) {
          // Add a day to the start date
          final addDaystartDate = startDate.add(const Duration(days: 1));

          return element.category.category.name == category.name &&
              element.date.dateOnly.isAfter(endDate) &&
              element.date.dateOnly.isBefore(addDaystartDate);
        })
        .map(Transaction.fromHiveModel)
        .toList();

    // Sort the transactions by amount
    final sorted = filtered..sort((a, b) => b.amount.compareTo(a.amount));

    return sorted;
  }

  Future<List<Transaction>> _getFirestoreTransactions(
      Category category, DateTime startDate, DateTime endDate) async {
    final transactions = await _dbFirestoreClient.getQueryOrderBy<Transaction>(
      collectionPath: 'transactions',
      field: 'userId',
      isEqualTo: _currentUser,
      descending: true,
      orderByField: 'amount',
      mapper: (data, documentId) => Transaction.fromJson(data!),
    );

    // Filter the transactions based on the [transactionType] and date range
    final filtered = transactions.where(
      (element) {
        // Add a day to the start date
        final addDaystartDate = startDate.add(const Duration(days: 1));

        return element.category.name == category.name &&
            element.date.dateOnly.isAfter(endDate) &&
            element.date.dateOnly.isBefore(addDaystartDate);
      },
    ).toList();

    // Sort the transactions by amount
    final sorted = filtered..sort((a, b) => b.amount.compareTo(a.amount));

    return sorted;
  }
}
