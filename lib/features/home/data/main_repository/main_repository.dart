import 'dart:async';
import 'package:auth_user/auth_user.dart';
import 'package:db_hive_client/db_hive_client.dart';
import 'package:db_firestore_client/db_firestore_client.dart';
import '../../../../core/models/totals_transaction_model.dart';
import '../../../../core/models/transaction_hive_model.dart';
import '../../../../core/models/transaction_model.dart';
import '../../../../core/utils/models/app_result.dart';
import 'main_base_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class MainRepository implements MainBaseRepository {
  final DbFirestoreClientBase _dbFirestoreClient;
  final DbHiveClientBase _dbHiveClient;
  final AuthUserBase _authUser;

  MainRepository({
    required DbFirestoreClientBase dbFirestoreClient,
    required DbHiveClientBase dbHiveClient,
    required AuthUserBase authUser,
  })  : _dbFirestoreClient = dbFirestoreClient,
        _dbHiveClient = dbHiveClient,
        _authUser = authUser;

  String get _currentUser => _authUser.currentUser!.uid;
  bool get _isUserLoggedIn => _authUser.currentUser != null;

  @override
  Stream<auth.User?> get userStream => _authUser.userStream;

  @override
  Future<AppResult<List<Transaction>>> getAll() async {
    if (!_isUserLoggedIn) {
      final transactions = _getHiveTransactions();
      final result = await transactions;

      // Convert the [TransactionHive] to [Transaction] and return the result
      final totalsTransaction = result.map(Transaction.fromHiveModel).toList();
      return AppResult.success(totalsTransaction);
    }
    final transactions = await _getDataAndClearHive();

    // Update the firestore and get the data
    final result = await _updateFirestoreAndGetData(transactions);
    return AppResult.success(result);
  }

  @override
  Future<AppResult<TotalsTransaction>> getTotals() async {
    if (!_isUserLoggedIn) {
      final transactions = _getHiveTransactions();
      final result = await transactions;

      // Convert the [TransactionHive] to [Transaction] and calculate the totals
      final totalsTransaction = TotalsTransaction.calcu(
        result.map(Transaction.fromHiveModel).toList(),
      );
      return AppResult.success(totalsTransaction);
    }
    final transactions = await _getDataAndClearHive();
    final result = await _updateFirestoreAndGetData(transactions);

    // Calculate the totals and return the result
    final totalsTransaction = TotalsTransaction.calcu(result);
    return AppResult.success(totalsTransaction);
  }

  Future<List<TransactionHive>> _getHiveTransactions() async {
    final transactions = await _dbHiveClient.getAll<TransactionHive>(
      boxName: 'transactions',
    );

    // Sort the transactions by amount
    final transactionsOrderByAmount = transactions
      ..sort((a, b) => b.amount.compareTo(a.amount));

    return transactionsOrderByAmount;
  }

  Future<List<TransactionHive>> _getDataAndClearHive() async {
    final transactions = _getHiveTransactions();
    await _dbHiveClient.clearAll<TransactionHive>(boxName: 'transactions');
    return transactions;
  }

  Future<List<Transaction>> _updateFirestoreAndGetData(
    List<TransactionHive> transactions,
  ) async {
    final updatedTransactions = transactions.map((hive) {
      return Transaction.fromHiveModel(hive).copyWith(userId: _currentUser);
    }).toList();

    await Future.wait(
      updatedTransactions.map(
        (transaction) => _dbFirestoreClient.setDocument(
          collectionPath: 'transactions',
          documentId: transaction.uuid!,
          merge: false,
          data: transaction.toJson(),
        ),
      ),
    );

    final result = await _dbFirestoreClient.getQueryOrderBy<Transaction>(
      collectionPath: 'transactions',
      field: 'userId',
      isEqualTo: _currentUser,
      descending: true,
      orderByField: 'amount',
      mapper: (data, documentId) => Transaction.fromJson(data!),
    );
    return result;
  }
}
