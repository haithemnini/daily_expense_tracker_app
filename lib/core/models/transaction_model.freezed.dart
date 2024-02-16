// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  String? get uuid => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get categorysIndex => throw _privateConstructorUsedError;
  TransactionCategory get transactionCategory =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {String? uuid,
      String? userId,
      double amount,
      DateTime date,
      int categorysIndex,
      TransactionCategory transactionCategory});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? userId = freezed,
    Object? amount = null,
    Object? date = null,
    Object? categorysIndex = null,
    Object? transactionCategory = null,
  }) {
    return _then(_value.copyWith(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      categorysIndex: null == categorysIndex
          ? _value.categorysIndex
          : categorysIndex // ignore: cast_nullable_to_non_nullable
              as int,
      transactionCategory: null == transactionCategory
          ? _value.transactionCategory
          : transactionCategory // ignore: cast_nullable_to_non_nullable
              as TransactionCategory,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uuid,
      String? userId,
      double amount,
      DateTime date,
      int categorysIndex,
      TransactionCategory transactionCategory});
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? userId = freezed,
    Object? amount = null,
    Object? date = null,
    Object? categorysIndex = null,
    Object? transactionCategory = null,
  }) {
    return _then(_$TransactionImpl(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      categorysIndex: null == categorysIndex
          ? _value.categorysIndex
          : categorysIndex // ignore: cast_nullable_to_non_nullable
              as int,
      transactionCategory: null == transactionCategory
          ? _value.transactionCategory
          : transactionCategory // ignore: cast_nullable_to_non_nullable
              as TransactionCategory,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionImpl implements _Transaction {
  const _$TransactionImpl(
      {required this.uuid,
      required this.userId,
      required this.amount,
      required this.date,
      required this.categorysIndex,
      required this.transactionCategory});

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  @override
  final String? uuid;
  @override
  final String? userId;
  @override
  final double amount;
  @override
  final DateTime date;
  @override
  final int categorysIndex;
  @override
  final TransactionCategory transactionCategory;

  @override
  String toString() {
    return 'Transaction(uuid: $uuid, userId: $userId, amount: $amount, date: $date, categorysIndex: $categorysIndex, transactionCategory: $transactionCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.categorysIndex, categorysIndex) ||
                other.categorysIndex == categorysIndex) &&
            (identical(other.transactionCategory, transactionCategory) ||
                other.transactionCategory == transactionCategory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, userId, amount, date,
      categorysIndex, transactionCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(
          {required final String? uuid,
          required final String? userId,
          required final double amount,
          required final DateTime date,
          required final int categorysIndex,
          required final TransactionCategory transactionCategory}) =
      _$TransactionImpl;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  String? get uuid;
  @override
  String? get userId;
  @override
  double get amount;
  @override
  DateTime get date;
  @override
  int get categorysIndex;
  @override
  TransactionCategory get transactionCategory;
  @override
  @JsonKey(ignore: true)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
