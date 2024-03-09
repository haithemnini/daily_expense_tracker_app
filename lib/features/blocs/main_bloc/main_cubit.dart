import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enum/enum.dart';
import '../../../../core/models/totals_transaction_model.dart';
import '../../../../core/models/transaction_model.dart';
import '../../home/data/main_repository/main_base_repository.dart';

part 'main_cubit.freezed.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final MainBaseRepository _mainRepository;

  MainCubit({
    required MainBaseRepository mainRepository,
  })  : _mainRepository = mainRepository,
        super(const MainState.initial());

  Future<void> getAll(TypeShow typeShow) async {
    emit(const MainState.loading());

    final result = await _mainRepository.getAll(
      limit: typeShow == TypeShow.limit ? 10 : null,
    );
    result.when(
      success: (all) => emit(
        typeShow == TypeShow.limit
            ? MainState.loadedLimit(all)
            : MainState.loadedAll(all),
      ),
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
