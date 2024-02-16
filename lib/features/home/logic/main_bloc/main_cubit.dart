import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/models/transaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/totals_transaction_model.dart';
import '../../data/main_repository/main_base_repository.dart';

part 'main_state.dart';
part 'home_cubit.freezed.dart';

class MainCubit extends Cubit<MainState> {
  final MainBaseRepository _mainRepository;

  late final StreamSubscription<List<Transaction>> _transactionsStream;
  late final StreamSubscription<TotalsTransaction> _totalsTransStream;

  MainCubit({
    required MainBaseRepository mainRepository,
  })  : _mainRepository = mainRepository,
        super(const MainState.initial()) {
    // / Listen to the totals transactions stream
    _totalsTransStream = _mainRepository.getTotalsStream().listen((totals) {
      debugPrint('totalsTransactions: $totals');
      emit(MainState.loadedTotals(totals));
    });

    // // / Listen to the transactions stream
    _transactionsStream = _mainRepository.getAllStream().listen((transactions) {
      debugPrint('transactions: $transactions');
      emit(MainState.loaded(transactions));
    });
  }

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

  @override
  Future<void> close() {
    _transactionsStream.cancel();
    _totalsTransStream.cancel();
    _mainRepository.dispose();
    return super.close();
  }
}
