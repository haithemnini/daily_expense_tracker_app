import 'package:user_service/user_service.dart';

abstract class ProfileBaseRepository {
  Future<void> updateProfile({
    required User user,
  });

  Future<String> updateUserPicture({
    required User user,
    required String imagePath,
  });
}
