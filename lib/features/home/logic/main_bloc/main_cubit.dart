import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../../core/models/transaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/totals_transaction_model.dart';
import '../../data/main_repository/main_base_repository.dart';

part 'main_state.dart';
part 'home_cubit.freezed.dart';

class MainCubit extends Cubit<MainState> {
  final MainBaseRepository _mainRepository;

  late final StreamSubscription<List<TransactionModel>>
      _transactionsStreamSubscription;

  late final StreamSubscription<TotalsTransactionModel>
      _totalsTransactionsStreamSubscription;

  MainCubit({required MainBaseRepository mainRepository})
      : _mainRepository = mainRepository,
        super(const MainState.initial()) {
    /// Listen to the totals transactions stream
    _totalsTransactionsStreamSubscription = _mainRepository
        .getTotalsTransactionsStream()
        .listen((totalsTransactions) {
      emit(MainState.loadedTotals(totalsTransactions));
    });

    // / Listen to the transactions stream
    _transactionsStreamSubscription =
        _mainRepository.getAllTransactionsStream().listen((transactions) {
      emit(MainState.loaded(transactions));
    });
  }

  Future<void> getAllTransactions() async {
    final result = await _mainRepository.getAllTransactions();
    result.when(
      success: (transactions) => emit(MainState.loaded(transactions)),
      failure: (message) => emit(MainState.error(message)),
    );
  }

  Future<void> getTotalsTransactions() async {
    emit(const MainState.loading());
    final result = await _mainRepository.getTotalsTransactions();
    result.when(
      success: (totalsTransactions) => emit(
        MainState.loadedTotals(totalsTransactions),
      ),
      failure: (message) => emit(MainState.error(message)),
    );
  }

  @override
  Future<void> close() {
    _transactionsStreamSubscription.cancel();
    _totalsTransactionsStreamSubscription.cancel();
    return super.close();
  }
}
