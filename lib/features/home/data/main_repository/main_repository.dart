import '../../../../core/extension/extension.dart';
import '../../../../core/models/transaction_hive_model.dart';
import 'package:daily_expense_tracker_app/core/service/network_info.dart';
import 'package:db_firestore_client/db_firestore_client.dart';
import 'package:db_hive_client/db_hive_client.dart';

import '../../../../core/enum/enum.dart';
import '../../../../core/models/totals_transaction_model.dart';
import '../../../../core/models/transaction_model.dart';
import '../../../../core/utils/models/app_result.dart';
import '../../../../core/utils/typedef/typedef.dart';
import 'main_base_repository.dart';

class MainRepository implements MainBaseRepository {
  final DbFirestoreClientBase _dbFirestoreClient;
  final DbHiveClientBase _dbHiveClient;
  final NetworkInfoBase _networkInfo;

  MainRepository({
    required DbFirestoreClientBase dbFirestoreClient,
    required DbHiveClientBase dbHiveClient,
    required NetworkInfoBase networkInfo,
  })  : _dbFirestoreClient = dbFirestoreClient,
        _dbHiveClient = dbHiveClient,
        _networkInfo = networkInfo;

  @override
  TransactionsAllStreamResult getAllTransactionsStream() async* {
    try {
      if (await _networkInfo.isConnected) {
        final result = _dbFirestoreClient.streamCollection<TransactionModel>(
          collectionPath: 'transactions',
          objectMapper: (data, documentId) => TransactionModel.fromJson(data!),
        );
        yield* result;
      } else {
        final result = _dbHiveClient.watchAll<TransactionHiveModel>(
          boxName: 'transactions',
        );

        final resultTransactions = result.map((resultHive) => resultHive
            .map((resultHive) => TransactionModel(
                  userId: resultHive.userId,
                  title: resultHive.title,
                  description: resultHive.description,
                  amount: resultHive.amount,
                  date: resultHive.date,
                  categoryIndex: resultHive.categoryIndex,
                  transactionType: resultHive.transactionType.transactionType,
                ))
            .toList());

        yield* resultTransactions;
      }
    } catch (err) {
      yield [];
    }
  }

  @override
  TotalsTransactionsStreamResult getTotalsTransactionsStream() {
    final TransactionsAllStreamResult result = getAllTransactionsStream();

    final Stream<TotalsTransactionModel> resultTotals = result.map(
        (transactions) => TotalsTransactionModel(

            /// totalExpense = totalExpense
            totalExpense: transactions
                .where((transaction) =>
                    transaction.transactionType == TransactionType.expense)
                .map((transaction) => transaction.amount)
                .fold(0.0, (prev, amount) => prev + amount),

            /// totalIncome = totalIncome - totalExpense
            totalIncome: transactions
                .where((transaction) =>
                    transaction.transactionType == TransactionType.income)
                .map((transaction) => transaction.amount)
                .fold(0.0, (prev, amount) => prev + amount),

            /// totalBalance = totalIncome - totalExpense
            totalBalance: transactions
                .map((transaction) => transaction.amount)
                .fold(0.0, (prev, amount) => prev + amount)));

    return resultTotals;
  }

  @override
  TransactionAllResult getAllTransactions() async {
    try {
      if (await _networkInfo.isConnected) {
        final result = await _dbFirestoreClient.getCollection<TransactionModel>(
          collectionPath: 'transactions',
          objectMapper: (data, documentId) => TransactionModel.fromJson(data!),
        );
        return AppResult.success(result);
      } else {
        final result = await _dbHiveClient.getAll<TransactionHiveModel>(
          boxName: 'transactions',
        );

        final resultTransactions = result
            .map((resultHive) => TransactionModel(
                  userId: resultHive.userId,
                  title: resultHive.title,
                  description: resultHive.description,
                  amount: resultHive.amount,
                  date: resultHive.date,
                  categoryIndex: resultHive.categoryIndex,
                  transactionType: resultHive.transactionType.transactionType,
                ))
            .toList();

        return AppResult.success(resultTransactions);
      }
    } catch (err) {
      return AppResult.failure(err.toString());
    }
  }

  @override
  TotalsTransactionsResult getTotalsTransactions() async {
    try {
      if (await _networkInfo.isConnected) {
        final result = await _dbFirestoreClient.getCollection<TransactionModel>(
          collectionPath: 'transactions',
          objectMapper: (data, documentId) => TransactionModel.fromJson(data!),
        );

        final resultTotals = TotalsTransactionModel(
          /// totalExpense = totalExpense
          totalExpense: result
              .where((transaction) =>
                  transaction.transactionType == TransactionType.expense)
              .map((transaction) => transaction.amount)
              .fold(0.0, (prev, amount) => prev + amount),

          /// totalIncome = totalIncome - totalExpense
          totalIncome: result
              .where((transaction) =>
                  transaction.transactionType == TransactionType.income)
              .map((transaction) => transaction.amount)
              .fold(0.0, (prev, amount) => prev + amount),

          /// totalBalance = totalIncome - totalExpense
          totalBalance: result
              .map((transaction) => transaction.amount)
              .fold(0.0, (prev, amount) => prev + amount),
        );

        return AppResult.success(resultTotals);
      } else {
        final List<TransactionHiveModel> result =
            await _dbHiveClient.getAll<TransactionHiveModel>(
          boxName: 'transactions',
        );

        final resultTransactions = result
            .map((resultHive) => TransactionModel(
                  userId: resultHive.userId,
                  title: resultHive.title,
                  description: resultHive.description,
                  amount: resultHive.amount,
                  date: resultHive.date,
                  categoryIndex: resultHive.categoryIndex,
                  transactionType: resultHive.transactionType.transactionType,
                ))
            .toList();

        final resultTotals = TotalsTransactionModel(
          /// totalExpense = totalExpense
          totalExpense: resultTransactions
              .where((transaction) =>
                  transaction.transactionType == TransactionType.expense)
              .map((transaction) => transaction.amount)
              .fold(0.0, (prev, amount) => prev + amount),

          /// totalIncome = totalIncome - totalExpense
          totalIncome: resultTransactions
              .where((transaction) =>
                  transaction.transactionType == TransactionType.income)
              .map((transaction) => transaction.amount)
              .fold(0.0, (prev, amount) => prev + amount),

          /// totalBalance = totalIncome - totalExpense
          totalBalance: resultTransactions
              .map((transaction) => transaction.amount)
              .fold(0.0, (prev, amount) => prev + amount),
        );

        return AppResult.success(resultTotals);
      }
    } catch (err) {
      return AppResult.failure(err.toString());
    }
  }
}
