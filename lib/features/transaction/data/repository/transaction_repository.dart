import 'dart:async';

import 'package:auth_user/auth_user.dart';
import 'package:db_firestore_client/db_firestore_client.dart';
import 'package:db_hive_client/db_hive_client.dart';

import '../../../../core/helper/helper.dart';
import '../../../../core/models/transaction_hive_model.dart';
import '../../../../core/models/transaction_model.dart';
import '../../../../core/utils/models/app_result.dart';
import 'transaction_base_repository.dart';

class TransactionRepository implements TransactionBaseRepository {
  final DbFirestoreClientBase _dbFirestoreClient;
  final DbHiveClientBase _dbHiveClient;
  final AuthUserBase _authUser;
  TransactionRepository({
    required DbFirestoreClientBase dbFirestoreClient,
    required AuthUserBase authUser,
    required DbHiveClientBase dbHiveClient,
  })  : _dbFirestoreClient = dbFirestoreClient,
        _dbHiveClient = dbHiveClient,
        _authUser = authUser;

  /// The [isUserLoggedIn] method is used to check if the user is logged in.
  /// If the user is logged in, it returns true.
  bool get isUserLoggedIn => _authUser.currentUser != null;

  @override
  Future<AppResult<void>> addTransaction(Transaction transaction) async {
    try {
      // Generate UUID for the transaction document
      final generUUID = Helper.generateUUID();

      if (!isUserLoggedIn) {
        await _dbHiveClient.add<TransactionHive>(
          boxName: 'transactions',
          modelId: generUUID,
          modelHive: transaction.copyWith(uuid: generUUID).toHiveModel(),
        );
      } else {
        _dbFirestoreClient.setDocument(
          collectionPath: 'transactions',
          merge: false,
          documentId: generUUID,
          data: transaction
              .copyWith(uuid: generUUID, userId: _authUser.currentUser?.uid)
              .toJson(),
        );
        // .then((value) => debugPrint('Transaction added successfully'));
      }

      return const AppResult.success(null);
    } catch (err) {
      return AppResult.failure(err.toString());
    }
  }

  @override
  Future<AppResult<void>> updateTransaction(Transaction transaction) async {
    try {
      if (!isUserLoggedIn) {
        await _dbHiveClient.update<TransactionHive>(
          boxName: 'transactions',
          modelId: transaction.uuid!,
          modelHive: transaction.toHiveModel(),
        );
      } else {
        await _dbFirestoreClient.updateDocument(
          collectionPath: 'transactions/${transaction.uuid}',
          data: transaction.toJson(),
        );
      }
      return const AppResult.success(null);
    } catch (err) {
      return AppResult.failure(err.toString());
    }
  }

  @override
  Future<AppResult<void>> deleteTransaction(String transactionId) async {
    try {
      if (!isUserLoggedIn) {
        await _dbHiveClient.delete<TransactionHive>(
          boxName: 'transactions',
          modelId: transactionId,
        );
        return const AppResult.success(null);
      }

      await _dbFirestoreClient.deleteDocument(
        collectionPath: 'transactions/$transactionId',
      );

      return const AppResult.success(null);
    } catch (err) {
      return AppResult.failure(err.toString());
    }
  }
}
