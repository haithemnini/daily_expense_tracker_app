import 'package:user_service/user_service.dart';

import 'profile_base_repository.dart';

class ProfileRepository implements ProfileBaseRepository {
  final UserServiceBase _userService;

  ProfileRepository({
    required UserServiceBase userService,
  }) : _userService = userService;

  @override
  Future<void> updateProfile({required User user}) {
    return _userService.updateUser(user);
  }

  @override
  Future<String> updateUserPicture({
    required User user,
    required String imagePath,
  }) {
    return _userService.updateUserPicture(user, imagePath);
  }
}
