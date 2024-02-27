import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../user_service.dart';

class UserService implements UserServiceBase {
  UserService({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<User> createUser(User user) {
    debugPrint('Creating user with id: ${user.uuid}');
    return _firebaseFirestore
        .collection('users')
        .doc(user.uuid)
        .set(user.toDocument())
        .then((value) => user);
  }

  @override
  Stream<User> getUser(String userId) {
    debugPrint('Getting user with id: $userId');
    return _firebaseFirestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snapshot) => User.fromSnapshot(snapshot));
  }

  @override
  Future<void> updateUser(User user) {
    debugPrint('Updating user with id: ${user.uuid}');
    return _firebaseFirestore
        .collection('users')
        .doc(user.uuid)
        .update(user.toDocument())
        .then(
          (value) => debugPrint('User updated'),
        );
  }
}
