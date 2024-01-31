// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseModelImpl _$$ExpenseModelImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseModelImpl(
      userId: json['userId'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      categoryIndex: json['categoryIndex'] as int,
      expenseType: $enumDecode(_$ExpenseTypeEnumMap, json['expenseType']),
      required: json['required'],
    );

Map<String, dynamic> _$$ExpenseModelImplToJson(_$ExpenseModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'categoryIndex': instance.categoryIndex,
      'expenseType': _$ExpenseTypeEnumMap[instance.expenseType]!,
      'required': instance.required,
    };

const _$ExpenseTypeEnumMap = {
  ExpenseType.expense: 'expense',
  ExpenseType.income: 'income',
};
