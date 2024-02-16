import 'core/models/models.dart';

abstract class UserServiceBase {
  Stream<User> getUser(String userId);
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
}
