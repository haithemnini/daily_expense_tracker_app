import 'package:db_firestore_client/db_firestore_client.dart';
import 'package:db_hive_client/db_hive_client.dart';

import '../../../../core/models/transaction_model.dart';

import 'transaction_base_repository.dart';

class TransactionRepository implements TransactionBaseRepository {
  final DbFirestoreClientBase _dbFirestoreClient;
  final DbHiveClientBase _dbHiveClient;

  TransactionRepository({
    required DbFirestoreClient dbFirestoreClient,
    required DbHiveClient dbHiveClient,
  })  : _dbFirestoreClient = dbFirestoreClient,
        _dbHiveClient = dbHiveClient;

  get transactionModel => null;

  @override
  Future<String> addTransaction(TransactionModel transactionModel) {
    return _dbFirestoreClient.addDocument(
      collectionPath: 'transactions',
      data: transactionModel.toJson(),
    );
  }

  @override
  Future<void> deleteTransaction(String transactionId) {
    return _dbFirestoreClient.deleteDocument(
      collectionPath: 'transactions/$transactionId',
    );
  }

  @override
  Future<void> updateTransaction(String transactionId) {
    return _dbFirestoreClient.updateDocument(
      collectionPath: 'transactions/$transactionModel',
      data: transactionModel.toJson(),
    );
  }
}
