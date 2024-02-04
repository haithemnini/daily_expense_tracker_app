import 'package:hive/hive.dart';

part 'transaction_hive_model.g.dart';

@HiveType(typeId: 0)
class TransactionHiveModel extends HiveObject {
  @HiveField(0)
  String? userId;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  double amount;

  @HiveField(4)
  DateTime date;

  @HiveField(5)
  int categoryIndex;

  @HiveField(6)
  TransactionTypeHive transactionType;

  TransactionHiveModel({
    required this.userId,
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.categoryIndex,
    required this.transactionType,
  });
}

@HiveType(typeId: 1)
enum TransactionTypeHive {
  @HiveField(0)
  expense,

  @HiveField(1)
  income,
}

class NewTransactionTypeHiveAdapter extends TypeAdapter<TransactionTypeHive> {
  @override
  final int typeId = 2;

  @override
  TransactionTypeHive read(BinaryReader reader) {
    return TransactionTypeHive.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, TransactionTypeHive obj) {
    writer.writeByte(obj.index);
  }
}
