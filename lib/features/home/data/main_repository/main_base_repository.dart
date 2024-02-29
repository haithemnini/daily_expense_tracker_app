import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../../core/models/totals_transaction_model.dart';
import '../../../../core/models/transaction_model.dart';
import '../../../../core/utils/models/app_result.dart';

abstract class MainBaseRepository {
  // Stream<User?> get userStream;
  /// The [user] stream is used to get the user.
  Stream<auth.User?> get userStream;
  Future<AppResult<List<Transaction>>> getAll();

  Future<AppResult<TotalsTransaction>> getTotals();
}
