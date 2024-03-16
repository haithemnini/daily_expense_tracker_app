import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enum/enum.dart';
import '../../../../core/models/transaction_model.dart';
import '../../home/data/state_repository/state_base_repository.dart';

part 'state_cubit.freezed.dart';
part 'state_state.dart';

class StateCubit extends Cubit<StateState> {
  final StateBaseRepository _statBaseRepository;

  StateCubit({
    required StateBaseRepository statBaseRepository,
  })  : _statBaseRepository = statBaseRepository,
        super(const StateState.initial()) {
    _startDate = DateTime.now();
    _endDate = DateTime.now().subtract(const Duration(days: 7));
    _transactionCategory = Category.income;
  }

  late DateTime _startDate;
  late DateTime _endDate;

  late DateTime newStartDate = _startDate;
  late DateTime newEndDate = _endDate;

  late Category _transactionCategory;

  DateTime get startDate => _startDate;
  DateTime get endDate => _endDate;

  Category get transactionCategory => _transactionCategory;

  void applyFilter() {
    // Check if the new start date and end date is different
    //from the old start date and end date
    if (newStartDate != _startDate || newEndDate != _endDate) {
      _startDate = newStartDate;
      _endDate = newEndDate;
      // Emit the new date
      emit(StateState.dateChanged(_startDate, _endDate));
      //apply the filter and get the stat
      getStat(_transactionCategory);
      return;
    }
  }

  Future<void> getStat(Category category) async {
    emit(const StateState.loading());

    // Set the transaction category
    _transactionCategory = category;

    // Get the stat
    final result = await _statBaseRepository.getState(
      category: category,
      startDate: _startDate,
      endDate: _endDate,
    );

    result.when(
      success: (all) => emit(StateState.loaded(
        all['transactions'] as List<Transaction>,
        all['chartData'] as Map<DateTime, double>,
      )),
      failure: (message) => emit(StateState.error(message)),
    );
  }
}
