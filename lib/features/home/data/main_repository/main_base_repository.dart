import '../../../../core/models/totals_transaction_model.dart';
import '../../../../core/models/transaction_model.dart';
import '../../../../core/utils/models/app_result.dart';

abstract class MainBaseRepository {
  Future<AppResult<List<Transaction>>> getAll({required int? limit});
  Future<AppResult<TotalsTransaction>> getTotals();
}
