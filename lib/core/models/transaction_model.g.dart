// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      uuid: json['uuid'] as String?,
      userId: json['userId'] as String?,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      categorysIndex: json['categorysIndex'] as int,
      transactionCategory: $enumDecode(
          _$TransactionCategoryEnumMap, json['transactionCategory']),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'userId': instance.userId,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'categorysIndex': instance.categorysIndex,
      'transactionCategory':
          _$TransactionCategoryEnumMap[instance.transactionCategory]!,
    };

const _$TransactionCategoryEnumMap = {
  TransactionCategory.expense: 'expense',
  TransactionCategory.income: 'income',
};
