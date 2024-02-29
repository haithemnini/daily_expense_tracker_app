// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'totals_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TotalsTransaction {
  double get totalIncome => throw _privateConstructorUsedError;
  double get totalExpense => throw _privateConstructorUsedError;
  double get totalBalance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TotalsTransactionCopyWith<TotalsTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotalsTransactionCopyWith<$Res> {
  factory $TotalsTransactionCopyWith(
          TotalsTransaction value, $Res Function(TotalsTransaction) then) =
      _$TotalsTransactionCopyWithImpl<$Res, TotalsTransaction>;
  @useResult
  $Res call({double totalIncome, double totalExpense, double totalBalance});
}

/// @nodoc
class _$TotalsTransactionCopyWithImpl<$Res, $Val extends TotalsTransaction>
    implements $TotalsTransactionCopyWith<$Res> {
  _$TotalsTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalIncome = null,
    Object? totalExpense = null,
    Object? totalBalance = null,
  }) {
    return _then(_value.copyWith(
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
      totalBalance: null == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TotalsTransactionModelImplCopyWith<$Res>
    implements $TotalsTransactionCopyWith<$Res> {
  factory _$$TotalsTransactionModelImplCopyWith(
          _$TotalsTransactionModelImpl value,
          $Res Function(_$TotalsTransactionModelImpl) then) =
      __$$TotalsTransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double totalIncome, double totalExpense, double totalBalance});
}

/// @nodoc
class __$$TotalsTransactionModelImplCopyWithImpl<$Res>
    extends _$TotalsTransactionCopyWithImpl<$Res, _$TotalsTransactionModelImpl>
    implements _$$TotalsTransactionModelImplCopyWith<$Res> {
  __$$TotalsTransactionModelImplCopyWithImpl(
      _$TotalsTransactionModelImpl _value,
      $Res Function(_$TotalsTransactionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalIncome = null,
    Object? totalExpense = null,
    Object? totalBalance = null,
  }) {
    return _then(_$TotalsTransactionModelImpl(
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
      totalBalance: null == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$TotalsTransactionModelImpl implements _TotalsTransactionModel {
  const _$TotalsTransactionModelImpl(
      {required this.totalIncome,
      required this.totalExpense,
      required this.totalBalance});

  @override
  final double totalIncome;
  @override
  final double totalExpense;
  @override
  final double totalBalance;

  @override
  String toString() {
    return 'TotalsTransaction(totalIncome: $totalIncome, totalExpense: $totalExpense, totalBalance: $totalBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotalsTransactionModelImpl &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.totalBalance, totalBalance) ||
                other.totalBalance == totalBalance));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, totalIncome, totalExpense, totalBalance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TotalsTransactionModelImplCopyWith<_$TotalsTransactionModelImpl>
      get copyWith => __$$TotalsTransactionModelImplCopyWithImpl<
          _$TotalsTransactionModelImpl>(this, _$identity);
}

abstract class _TotalsTransactionModel implements TotalsTransaction {
  const factory _TotalsTransactionModel(
      {required final double totalIncome,
      required final double totalExpense,
      required final double totalBalance}) = _$TotalsTransactionModelImpl;

  @override
  double get totalIncome;
  @override
  double get totalExpense;
  @override
  double get totalBalance;
  @override
  @JsonKey(ignore: true)
  _$$TotalsTransactionModelImplCopyWith<_$TotalsTransactionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
