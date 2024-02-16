import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String? uuid,
    required String email,
    required String fullName,
    required String? photoUrl,
  }) = _User;

  factory User.empty() {
    return const User(
      uuid: '',
      email: '',
      fullName: '',
      photoUrl: '',
    );
  }

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    return User(
      uuid: snapshot.id,
      email: snapshot['email'],
      fullName: snapshot['fullName'],
      photoUrl: snapshot['photoUrl'],
    );
  }
}

extension UserExtensions on User {
  Map<String, dynamic> toDocument() {
    return {
      'email': email,
      'fullName': fullName,
      'photoUrl': photoUrl,
    };
  }
}
