import '../../../../core/enum/enum.dart';
import '../../../../core/utils/models/app_result.dart';

abstract class StateBaseRepository {
  Future<AppResult<Map<String, dynamic>>> getState({
    required Category category,
    required DateTime startDate,
    required DateTime endDate,
  });
}
