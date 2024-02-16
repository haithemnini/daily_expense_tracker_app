import 'dart:async';
import 'package:auth_user/auth_user.dart';
import 'package:db_hive_client/db_hive_client.dart';
import 'package:db_firestore_client/db_firestore_client.dart';

import '../../../../core/models/totals_transaction_model.dart';
import '../../../../core/models/transaction_hive_model.dart';
import '../../../../core/models/transaction_model.dart';
import '../../../../core/utils/models/app_result.dart';
import 'main_base_repository.dart';

class MainRepository implements MainBaseRepository {
  final DbFirestoreClientBase _dbFirestoreClient;
  final DbHiveClientBase _dbHiveClient;
  final AuthUserBase _authUser;
  late StreamSubscription<void> _userSubscription;

  MainRepository({
    required DbFirestoreClientBase dbFirestoreClient,
    required DbHiveClientBase dbHiveClient,
    required AuthUserBase authUser,
  })  : _dbFirestoreClient = dbFirestoreClient,
        _dbHiveClient = dbHiveClient,
        _authUser = authUser {
    _userSubscription = _authUser.user.listen((user) {
      _isUserLoggedIn = user != null;
    });
  }

  bool _isUserLoggedIn = false;

  String get currentUser => _authUser.currentUser?.uid ?? '';

  @override
  Stream<List<Transaction>> getAllStream() async* {
    if (!_isUserLoggedIn) {
      yield* _dbHiveClient
          .watchAll<TransactionHive>(boxName: 'transactions')
          .map(
        (transactions) {
          return transactions.map(Transaction.fromHiveModel).toList();
        },
      );
    }

    final transactions = await _dbHiveClient.getAll<TransactionHive>(
      boxName: 'transactions',
    );
    final updatedTransactions = transactions.map((hive) {
      return Transaction.fromHiveModel(hive).copyWith(userId: currentUser);
    }).toList();

    await _dbHiveClient.clearAll(boxName: 'transactions');
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

    yield* _dbFirestoreClient.streamQuery<Transaction>(
      collectionPath: 'transactions',
      field: 'userId',
      isEqualTo: currentUser,
      mapper: (data, documentId) => Transaction.fromJson(data!),
    );
  }

  @override
  Stream<TotalsTransaction> getTotalsStream() {
    return getAllStream().map(TotalsTransaction.calculation);
  }

  @override
  Future<AppResult<List<Transaction>>> getAll() async {
    if (!_isUserLoggedIn) {
      final transactions = await _dbHiveClient.getAll<TransactionHive>(
        boxName: 'transactions',
      );
      return AppResult.success(
        transactions.map(Transaction.fromHiveModel).toList(),
      );
    }

    final transactions = await _dbHiveClient.getAll<TransactionHive>(
      boxName: 'transactions',
    );

    final updatedTransactions = transactions.map((hive) {
      return Transaction.fromHiveModel(hive).copyWith(userId: currentUser);
    }).toList();

    await _dbHiveClient.clearAll(boxName: 'transactions');

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

    final result = await _dbFirestoreClient.getQuery<Transaction>(
      collectionPath: 'transactions',
      field: 'userId',
      isEqualTo: currentUser,
      mapper: (data, documentId) => Transaction.fromJson(data!),
    );

    return AppResult.success(result);
  }

  @override
  Future<AppResult<TotalsTransaction>> getTotals() async {
    if (!_isUserLoggedIn) {
      final transactions = await _dbHiveClient.getAll<TransactionHive>(
        boxName: 'transactions',
      );
      return AppResult.success(
        TotalsTransaction.calculation(
          transactions.map(Transaction.fromHiveModel).toList(),
        ),
      );
    }

    final transactions = await _dbHiveClient.getAll<TransactionHive>(
      boxName: 'transactions',
    );
    final updatedTransactions = transactions.map((hive) {
      return Transaction.fromHiveModel(hive).copyWith(
        userId: currentUser,
      );
    }).toList();

    await _dbHiveClient.clearAll(boxName: 'transactions');

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

    final result = await _dbFirestoreClient.getQuery<Transaction>(
      collectionPath: 'transactions',
      field: 'userId',
      isEqualTo: currentUser,
      mapper: (data, documentId) => Transaction.fromJson(data!),
    );

    return AppResult.success(TotalsTransaction.calculation(result));
  }

  @override
  void dispose() => _userSubscription.cancel();
}
