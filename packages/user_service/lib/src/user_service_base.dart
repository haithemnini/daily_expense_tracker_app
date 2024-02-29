import 'core/models/models.dart';

abstract class UserServiceBase {
  Stream<User?> getUser(String userId);
  Future<User> createUser(User user);
  Future<void> updateUser(User user);
  Future<String> updateUserPicture(User user, String imagePath);
  Future<void> deleteUser(User user);
}
