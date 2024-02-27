import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import '../../../../core/models/transaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/totals_transaction_model.dart';
import '../../data/main_repository/main_base_repository.dart';

part 'main_state.dart';
part 'home_cubit.freezed.dart';

class MainCubit extends Cubit<MainState> {
  final MainBaseRepository _mainRepository;

  MainCubit({
    required MainBaseRepository mainRepository,
  })  : _mainRepository = mainRepository,
        super(const MainState.initial());

  // The [user] stream is used to get the user.
  Stream<auth.User?> get userStream => _mainRepository.userStream;

  Future<void> getAll() async {
    final result = await _mainRepository.getAll();
    result.when(
      success: (all) => emit(MainState.loaded(all)),
      failure: (message) => emit(MainState.error(message)),
    );
  }

  Future<void> getTotals() async {
    final result = await _mainRepository.getTotals();
    result.when(
      success: (allTotals) => emit(MainState.loadedTotals(allTotals)),
      failure: (message) => emit(MainState.error(message)),
    );
  }
}
