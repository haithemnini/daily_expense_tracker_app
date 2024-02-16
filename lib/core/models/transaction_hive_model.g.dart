// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionHiveAdapter extends TypeAdapter<TransactionHive> {
  @override
  final int typeId = 0;

  @override
  TransactionHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionHive(
      uuid: fields[0] as String,
      userId: fields[1] as String?,
      date: fields[3] as DateTime,
      amount: fields[2] as double,
      categorysIndex: fields[4] as int,
      transactionCategory: fields[5] as TransactionCategoryHive,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionHive obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.categorysIndex)
      ..writeByte(5)
      ..write(obj.transactionCategory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransactionCategoryHiveAdapter
    extends TypeAdapter<TransactionCategoryHive> {
  @override
  final int typeId = 1;

  @override
  TransactionCategoryHive read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TransactionCategoryHive.expense;
      case 1:
        return TransactionCategoryHive.income;
      default:
        return TransactionCategoryHive.expense;
    }
  }

  @override
  void write(BinaryWriter writer, TransactionCategoryHive obj) {
    switch (obj) {
      case TransactionCategoryHive.expense:
        writer.writeByte(0);
        break;
      case TransactionCategoryHive.income:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionCategoryHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
