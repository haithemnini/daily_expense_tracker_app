import '../../models/totals_transaction_model.dart';
import '../../models/transaction_model.dart';
import '../models/app_result.dart';

typedef TransactionsAllStreamResult = Stream<List<TransactionModel>>;
typedef TotalsTransactionsStreamResult = Stream<TotalsTransactionModel>;

typedef TransactionAllResult = Future<AppResult<List<TransactionModel>>>;
typedef TotalsTransactionsResult = Future<AppResult<TotalsTransactionModel>>;
