import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_service/user_service.dart';

import '../../settings/data/auth_repository/auth_base_repository.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthBaseRepository _authRepository;
  final UserServiceBase _userService;

  AuthCubit({
    required AuthBaseRepository authRepository,
    required UserServiceBase userService,
  })  : _authRepository = authRepository,
        _userService = userService,
        super(const AuthState.authChanged(
          authStatus: AuthStatus.unknown,
        )) {
    initAuth();
  }

  void initAuth() {
    if (_authRepository.currentUser != null) {
      _userService.getUser(_authRepository.currentUser!.uid).listen(
            (user) => emit(
              AuthState.authChanged(
                authStatus: AuthStatus.authenticated,
                user: user,
              ),
            ),
          );
    } else {
      emit(const AuthState.authChanged(
        authStatus: AuthStatus.unauthenticated,
      ));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(const AuthState.loading());
    final result = await _authRepository.signInWithGoogle();
    result.when(
      success: (user) => {
        _userService.getUser(user.uuid!).listen(
              (user) => emit(
                AuthState.authChanged(
                  user: user,
                  authStatus: AuthStatus.authenticated,
                ),
              ),
            ),
      },
      failure: (message) => emit(AuthState.error(message)),
    );
  }

  Future<void> signOut() async {
    emit(const AuthState.loading());
    final result = await _authRepository.signOut();
    result.when(
      success: (_) => emit(const AuthState.authChanged(
        authStatus: AuthStatus.unauthenticated,
      )),
      failure: (message) => emit(AuthState.error(message)),
    );
  }
}
