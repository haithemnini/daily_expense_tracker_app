import 'package:cloud_firestore/cloud_firestore.dart';

import 'common/core_typedefs.dart';
import 'db_firestore_client_base.dart';

class DbFirestoreClient implements DbFirestoreClientBase {
  DbFirestoreClient({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Future<String> addDocument({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    DocumentReference<Map<String, dynamic>> docRef =
        await _firestore.collection(collectionPath).add(data);

    return docRef.id;
  }

  @override
  Future<String> updateDocument({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    DocumentReference<Map<String, dynamic>> docRef;
    docRef = _firestore.doc(collectionPath);
    await docRef.update(data);

    return docRef.id;
  }

  @override
  Future<String> deleteDocument({
    required String collectionPath,
  }) async {
    DocumentReference<Map<String, dynamic>> docRef;
    docRef = _firestore.doc(collectionPath);
    await docRef.delete();

    return docRef.id;
  }

  @override
  Future<void> setDocument({
    required String collectionPath,
    required String documentId,
    required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    DocumentReference<Map<String, dynamic>> docRef;
    docRef = _firestore.collection(collectionPath).doc(documentId);

    await docRef.set(data, SetOptions(merge: merge));
  }

  @override
  Future<T?> getDocument<T>({
    required String documentId,
    required String collectionPath,
    required ObjectMapper<T> objectMapper,
  }) async {
    DocumentReference<Map<String, dynamic>> docRef;
    docRef = _firestore.collection(collectionPath).doc(documentId);

    final snapshot = await docRef.get();
    final result = objectMapper(snapshot.data(), snapshot.id);

    return result;
  }

  @override
  Stream<T?> streamDocument<T>({
    required String collectionPath,
    required String documentId,
    required ObjectMapper<T> objectMapper,
  }) {
    DocumentReference<Map<String, dynamic>> docRef;

    docRef = _firestore.collection(collectionPath).doc(documentId);

    final snapshots = docRef.snapshots();
    final result = snapshots.map((doc) {
      if (doc.data() != null) {
        return objectMapper(doc.data()!, doc.id);
      } else {
        return null;
      }
    });

    return result;
  }

  @override
  Future<List<T>> getCollection<T>({
    required String collectionPath,
    required ObjectMapper<T> objectMapper,
  }) async {
    Query<Map<String, dynamic>> query;
    query = _firestore.collection(collectionPath);

    final snapshot = await query.get();
    final result = snapshot.docs
        .map((snapshots) => objectMapper(snapshots.data(), snapshots.id))
        .where((value) => value != null)
        .toList(growable: false);

    return result;
  }

  @override
  Stream<List<T>> streamCollection<T>({
    required String collectionPath,
    required ObjectMapper<T> objectMapper,
  }) {
    CollectionReference<Map<String, dynamic>> collectionRef;
    collectionRef = _firestore.collection(collectionPath);

    final snapshots = collectionRef.snapshots();

    final result = snapshots.map((snapshot) {
      return snapshot.docs
          .map((doc) => objectMapper(doc.data(), doc.id))
          .toList(growable: false);
    });

    return result;
  }

  @override
  Stream<List<T>> streamQuery<T>({
    required String collectionPath,
    required ObjectMapper<T> mapper,
    required String field,
    required dynamic value,
  }) {
    return _firestore
        .collection(collectionPath)
        .where(field, isEqualTo: value)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => mapper(doc.data(), doc.id))
              .toList(growable: false),
        );
  }

  @override
  Future<List<T>> getQuery<T>({
    required String collectionPath,
    required ObjectMapper<T> mapper,
    required String field,
    required dynamic value,
  }) async {
    return _firestore
        .collection(collectionPath)
        .where(field, isEqualTo: value)
        .get()
        .then(
          (snapshot) => snapshot.docs
              .map((doc) => mapper(doc.data(), doc.id))
              .toList(growable: false),
        );
  }
}