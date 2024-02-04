import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:daily_expense_tracker_app/core/models/transaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/totals_transaction_model.dart';
import '../../data/repository/home_base_repository.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeBaseRepository _homeRepository;

  late final StreamSubscription<List<TransactionModel>>
      _transactionsStreamSubscription;

  late final StreamSubscription<TotalsTransactionModel>
      _totalsTransactionsStreamSubscription;

  HomeCubit({required HomeBaseRepository homeRepository})
      : _homeRepository = homeRepository,
        super(const HomeState.initial()) {
    /// Listen to the transactions stream
    _transactionsStreamSubscription = _homeRepository
        .getAllTransactionsStream()
        .listen((transactions) => emit(HomeState.loaded(transactions)));

    /// Listen to the totals transactions stream
    _totalsTransactionsStreamSubscription = _homeRepository
        .getTotalsTransactionsStream()
        .listen((totalsTransactions) =>
            emit(HomeState.loadedTotals(totalsTransactions)));
  }

  Future<void> getAllTransactions() async {
    final result = await _homeRepository.getAllTransactions();
    result.when(
      success: (transactions) => emit(HomeState.loaded(transactions)),
      failure: (message) => emit(HomeState.error(message)),
    );
  }

  Future<void> getTotalsTransactions() async {
    final result = await _homeRepository.getTotalsTransactions();
    result.when(
      success: (totalsTransactions) => emit(
        HomeState.loadedTotals(totalsTransactions),
      ),
      failure: (message) => emit(HomeState.error(message)),
    );
  }

  @override
  Future<void> close() {
    _transactionsStreamSubscription.cancel();
    _totalsTransactionsStreamSubscription.cancel();
    return super.close();
  }
}
