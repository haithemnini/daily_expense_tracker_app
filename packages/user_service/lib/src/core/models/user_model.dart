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

  // String get initials {
  //   final List<String> nameParts = fullName.split(' ');
  //   if (nameParts.length > 1) {
  //     return '${nameParts[0][0]}${nameParts[1][0]}';
  //   } else {
  //     return nameParts[0][0];
  //   }
  // }

  // String get initials => fullName.split(' ').map((e) => e[0]).join();
}
