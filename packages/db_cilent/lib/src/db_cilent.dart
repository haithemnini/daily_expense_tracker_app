import 'package:cloud_firestore/cloud_firestore.dart';

typedef ObjectMapper<T> = T Function(
  Map<String, dynamic>? data,
  String? documentId,
);

class DbCilent {
  DbCilent({
    required FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Future<String> addDocument({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    DocumentReference<Map<String, dynamic>> docRef =
        await _firestore.collection(collectionPath).add(data);

    return docRef.id;
  }

  Future<String> updateDocument({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    DocumentReference<Map<String, dynamic>> docRef;
    docRef = _firestore.doc(path);
    await docRef.update(data);

    return docRef.id;
  }

  Future<String> deleteDocument({
    required String path,
  }) async {
    DocumentReference<Map<String, dynamic>> docRef;
    docRef = _firestore.doc(path);
    await docRef.delete();

    return docRef.id;
  }

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

  Stream<List<T>> streamCollection<T>({
    required String collectionPath,
    required ObjectMapper<T> mapper,
  }) {
    CollectionReference<Map<String, dynamic>> collectionRef;
    collectionRef = _firestore.collection(collectionPath);

    final snapshots = collectionRef.snapshots();

    final result = snapshots.map((snapshot) {
      return snapshot.docs
          .map((doc) => mapper(doc.data(), doc.id))
          .toList(growable: false);
    });

    return result;
  }

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

  Future<List<T>> getQuery<T>({
    required String path,
    required ObjectMapper<T> mapper,
    required String field,
    required dynamic value,
  }) async {
    return _firestore
        .collection(path)
        .where(field, isEqualTo: value)
        .get()
        .then(
          (snapshot) => snapshot.docs
              .map((doc) => mapper(doc.data(), doc.id))
              .toList(growable: false),
        );
  }

  // Future<List<T>> getQueryWithLimit<T>({
  //   required String path,
  //   required ObjectMapper<T> mapper,
  //   required String field,
  //   required dynamic value,
  //   required int limit,
  // }) async {
  //   return _firestore
  //       .collection(path)
  //       .where(field, isEqualTo: value)
  //       .limit(limit)
  //       .get()
  //       .then(
  //         (snapshot) => snapshot.docs
  //             .map((doc) => mapper(doc.data(), doc.id))
  //             .toList(growable: false),
  //       );
  // }
}
