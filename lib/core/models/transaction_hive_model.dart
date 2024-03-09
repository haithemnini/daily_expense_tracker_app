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
  CategoryHive category;

  TransactionHive({
    required this.uuid,
    required this.userId,
    required this.date,
    required this.amount,
    required this.categorysIndex,
    required this.category,
  });
}

@HiveType(typeId: 1)
enum CategoryHive {
  @HiveField(0)
  expense,

  @HiveField(1)
  income,
}

class NewCategoryHiveAdapter extends TypeAdapter<CategoryHive> {
  @override
  final int typeId = 2;

  @override
  CategoryHive read(BinaryReader reader) {
    return CategoryHive.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, CategoryHive obj) {
    writer.writeByte(obj.index);
  }
}
