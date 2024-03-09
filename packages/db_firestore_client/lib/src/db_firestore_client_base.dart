import 'common/core_typedefs.dart';

abstract class DbFirestoreClientBase {
  Future<void> addDocument({
    required String collectionPath,
    required Map<String, dynamic> data,
  });

  Future<void> updateDocument({
    required String collectionPath,
    required Map<String, dynamic> data,
  });

  Future<String> deleteDocument({
    required String collectionPath,
  });

  Future<void> setDocument({
    required String collectionPath,
    required String documentId,
    required Map<String, dynamic> data,
    required bool merge,
  });

  Future<T?> getDocument<T>({
    required String documentId,
    required String collectionPath,
    required ObjectMapper<T> objectMapper,
  });

  Stream<T?> streamDocument<T>({
    required String collectionPath,
    required String documentId,
    required ObjectMapper<T> objectMapper,
  });

  Future<List<T>> getCollection<T>({
    required String collectionPath,
    required ObjectMapper<T> objectMapper,
  });

  Stream<List<T>> streamCollection<T>({
    required String collectionPath,
    required ObjectMapper<T> objectMapper,
  });

  Future<List<T>> getQuery<T>({
    required String collectionPath,
    required ObjectMapper<T> mapper,
    required String field,
    required dynamic isEqualTo,
  });

  Stream<List<T>> streamQuery<T>({
    required String collectionPath,
    required ObjectMapper<T> mapper,
    required String field,
    required dynamic isEqualTo,
  });

  Stream<List<T>> streamCollectionOrderBy<T>({
    required String collectionPath,
    required ObjectMapper<T> objectMapper,
    required String orderByField,
    bool descending = false,
  });

  Future<List<T>> getQueryOrderBy<T>({
    required String collectionPath,
    required ObjectMapper<T> mapper,
    required String field,
    required dynamic isEqualTo,
    required String orderByField,
    bool descending = false,
    int? limit,
  });

  Stream<List<T>> streamQueryOrderBy<T>({
    required String collectionPath,
    required ObjectMapper<T> mapper,
    required String field,
    required dynamic isEqualTo,
    required String orderByField,
    bool descending = false,
  });
}
