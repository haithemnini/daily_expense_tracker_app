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
      date: const TimestampConverter().fromJson(json['date'] as Timestamp),
      categorysIndex: json['categorysIndex'] as int,
      category: $enumDecode(_$CategoryEnumMap, json['category']),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'userId': instance.userId,
      'amount': instance.amount,
      'date': const TimestampConverter().toJson(instance.date),
      'categorysIndex': instance.categorysIndex,
      'category': _$CategoryEnumMap[instance.category]!,
    };

const _$CategoryEnumMap = {
  Category.expense: 'expense',
  Category.income: 'income',
};
