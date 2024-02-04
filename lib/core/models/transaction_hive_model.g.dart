// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionHiveModelAdapter extends TypeAdapter<TransactionHiveModel> {
  @override
  final int typeId = 0;

  @override
  TransactionHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionHiveModel(
      userId: fields[0] as String?,
      title: fields[1] as String,
      description: fields[2] as String,
      amount: fields[3] as double,
      date: fields[4] as DateTime,
      categoryIndex: fields[5] as int,
      transactionType: fields[6] as TransactionTypeHive,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionHiveModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.categoryIndex)
      ..writeByte(6)
      ..write(obj.transactionType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransactionTypeHiveAdapter extends TypeAdapter<TransactionTypeHive> {
  @override
  final int typeId = 1;

  @override
  TransactionTypeHive read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TransactionTypeHive.expense;
      case 1:
        return TransactionTypeHive.income;
      default:
        return TransactionTypeHive.expense;
    }
  }

  @override
  void write(BinaryWriter writer, TransactionTypeHive obj) {
    switch (obj) {
      case TransactionTypeHive.expense:
        writer.writeByte(0);
        break;
      case TransactionTypeHive.income:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionTypeHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
