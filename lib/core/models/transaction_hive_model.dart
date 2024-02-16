import 'package:hive/hive.dart';

part 'transaction_hive_model.g.dart';

@HiveType(typeId: 0)
class TransactionHive extends HiveObject {
  @HiveField(0)
  String uuid;

  @HiveField(1)
  String? userId;

  @HiveField(2)
  double amount;

  @HiveField(3)
  DateTime date;

  @HiveField(4)
  int categorysIndex;

  @HiveField(5)
  TransactionCategoryHive transactionCategory;

  TransactionHive({
    required this.uuid,
    required this.userId,
    required this.date,
    required this.amount,
    required this.categorysIndex,
    required this.transactionCategory,
  });

  // factory TransactionHive.toHiveModel(
  //   Transaction transaction, {
  //   required String uuid,
  // }) {
  //   return TransactionHive(
  //     uuid: uuid,
  //     userId: transaction.userId,
  //     amount: transaction.amount,
  //     date: transaction.date,
  //     categorysIndex: transaction.categorysIndex,
  //     transactionCategory:
  //         transaction.transactionCategory == TransactionCategory.expense
  //             ? TransactionCategoryHive.expense
  //             : TransactionCategoryHive.income,
  //   );
  // }
}

@HiveType(typeId: 1)
enum TransactionCategoryHive {
  @HiveField(0)
  expense,

  @HiveField(1)
  income,
}

class NewTransactionCategoryHiveAdapter
    extends TypeAdapter<TransactionCategoryHive> {
  @override
  final int typeId = 2;

  @override
  TransactionCategoryHive read(BinaryReader reader) {
    return TransactionCategoryHive.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, TransactionCategoryHive obj) {
    writer.writeByte(obj.index);
  }
}
