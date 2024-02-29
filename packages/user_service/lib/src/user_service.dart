import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import '../user_service.dart';

class UserService implements UserServiceBase {
  UserService({
    FirebaseFirestore? firebaseFirestore,
    FirebaseStorage? firebaseStorage,
  })  : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance;

  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;

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
  Stream<User?> getUser(String userId) {
    debugPrint('Getting user with id: $userId');
    return _firebaseFirestore.collection('users').doc(userId).snapshots().map(
      (snapshot) {
        if (!snapshot.exists) {
          return null;
        }
        return User.fromSnapshot(snapshot);
      },
    );
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

  @override
  Future<void> deleteUser(User user) {
    debugPrint('Deleting user with id: ${user.uuid}');
    return _firebaseFirestore.collection('users').doc(user.uuid).delete().then(
          (value) => debugPrint('User deleted'),
        );
  }

  @override
  Future<String> updateUserPicture(User user, String imagePath) {
    debugPrint('Updating user image with id: ${user.uuid}');
    final ref = _firebaseStorage.ref().child('users/${user.uuid}/profile');
    return ref
        .putFile(File(imagePath))
        .then((value) => value.ref.getDownloadURL());
  }
}
