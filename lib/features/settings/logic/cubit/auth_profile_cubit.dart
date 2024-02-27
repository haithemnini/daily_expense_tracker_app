import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_service/user_service.dart';

import '../../data/auth_profile_repository/auth_profile_base_repository.dart';

part 'auth_profile_cubit.freezed.dart';
part 'auth_profile_state.dart';

class AuthProfileCubit extends Cubit<AuthProfileState> {
  final AuthProfileBaseRepository _authProfileRepository;
  final UserServiceBase _userService;

  AuthProfileCubit({
    required AuthProfileBaseRepository authProfileRepository,
    required UserServiceBase userService,
  })  : _authProfileRepository = authProfileRepository,
        _userService = userService,
        super(const AuthProfileState.authChanged(
          authStatus: AuthStatus.unknown,
        ));

  void initAuthProfile() {
    if (_authProfileRepository.currentUser != null) {
      _userService.getUser(_authProfileRepository.currentUser!.uid).listen(
            (user) => emit(
              AuthProfileState.authChanged(
                authStatus: AuthStatus.authenticated,
                user: user,
              ),
            ),
          );
    } else {
      emit(const AuthProfileState.authChanged(
        authStatus: AuthStatus.unauthenticated,
      ));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(const AuthProfileState.loading());
    final result = await _authProfileRepository.signInWithGoogle();
    result.when(
      success: (user) => {
        _userService.getUser(user.uuid!).listen(
              (user) => emit(
                AuthProfileState.authChanged(
                  authStatus: AuthStatus.authenticated,
                  user: user,
                ),
              ),
            ),
      },
      failure: (message) => emit(AuthProfileState.error(message)),
    );
  }

  Future<void> signOut() async {
    emit(const AuthProfileState.loading());
    final result = await _authProfileRepository.signOut();
    result.when(
      success: (_) => emit(const AuthProfileState.authChanged(
        authStatus: AuthStatus.unauthenticated,
      )),
      failure: (message) => emit(AuthProfileState.error(message)),
    );
  }
}
