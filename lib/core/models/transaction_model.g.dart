// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionModelImpl(
      userId: json['userId'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      categoryIndex: json['categoryIndex'] as int,
      transactionType:
          $enumDecode(_$TransactionTypeEnumMap, json['transactionType']),
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'categoryIndex': instance.categoryIndex,
      'transactionType': _$TransactionTypeEnumMap[instance.transactionType]!,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.expense: 'expense',
  TransactionType.income: 'income',
};
