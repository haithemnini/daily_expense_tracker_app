import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_service/user_service.dart';

import '../../data/auth_profile_repository/auth_profile_base_repository.dart';

part 'auth_profile_state.dart';
part 'auth_profile_cubit.freezed.dart';

class AuthProfileCubit extends Cubit<AuthProfileState> {
  final AuthProfileBaseRepository _authProfileRepository;
  final UserService _userService;

  AuthProfileCubit({
    required AuthProfileBaseRepository authProfileRepository,
    required UserService userService,
  })  : _authProfileRepository = authProfileRepository,
        _userService = userService,
        super(const AuthProfileState.authChanged(
          authStatus: AuthStatus.unknown,
        )) {
    _userSubscription = _authProfileRepository.userStream.listen((user) {
      debugPrint('AuthProfileCubit: user: $user');
      if (user != null) {
        _userService.getUser(user.uid).listen((user) {
          emit(AuthProfileState.authChanged(
            authStatus: AuthStatus.authenticated,
            user: user,
          ));
        });
      } else {
        emit(const AuthProfileState.authChanged(
          authStatus: AuthStatus.unauthenticated,
        ));
      }
    });
  }

  late final StreamSubscription _userSubscription;

  void initAuth() {
    if (_authProfileRepository.currentUser != null) {
      emit(AuthProfileState.authChanged(
        authStatus: AuthStatus.authenticated,
        user: _authProfileRepository.currentUser!.toUser(),
      ));
    } else {
      emit(const AuthProfileState.authChanged(
        authStatus: AuthStatus.unauthenticated,
      ));
    }
  }

  Future<void> signUpWithGoogle() async {
    emit(const AuthProfileState.loading());
    final result = await _authProfileRepository.signUpWithGoogle();
    result.when(
      success: (user) => emit(AuthProfileState.loaded(user)),
      failure: (message) => emit(AuthProfileState.error(message)),
    );
  }

  Future<void> signOut() async {
    emit(const AuthProfileState.loading());
    final result = await _authProfileRepository.signOut();
    result.when(
      success: (_) => emit(const AuthProfileState.initial()),
      failure: (message) => emit(AuthProfileState.error(message)),
    );
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}

extension on auth.User {
  User toUser() {
    return User(
      uuid: uid,
      email: email!,
      fullName: displayName!,
      photoUrl: photoURL,
    );
  }
}
