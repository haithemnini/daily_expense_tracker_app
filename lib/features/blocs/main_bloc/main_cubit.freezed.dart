// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Transaction> transactions) loadedAll,
    required TResult Function(List<Transaction> transactions) loadedLimit,
    required TResult Function(TotalsTransaction totalsTransactions)
        loadedTotals,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Transaction> transactions)? loadedAll,
    TResult? Function(List<Transaction> transactions)? loadedLimit,
    TResult? Function(TotalsTransaction totalsTransactions)? loadedTotals,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Transaction> transactions)? loadedAll,
    TResult Function(List<Transaction> transactions)? loadedLimit,
    TResult Function(TotalsTransaction totalsTransactions)? loadedTotals,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loadedAll,
    required TResult Function(LoadedLimit value) loadedLimit,
    required TResult Function(LoadedTotals value) loadedTotals,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loadedAll,
    TResult? Function(LoadedLimit value)? loadedLimit,
    TResult? Function(LoadedTotals value)? loadedTotals,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loadedAll,
    TResult Function(LoadedLimit value)? loadedLimit,
    TResult Function(LoadedTotals value)? loadedTotals,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'MainState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Transaction> transactions) loadedAll,
    required TResult Function(List<Transaction> transactions) loadedLimit,
    required TResult Function(TotalsTransaction totalsTransactions)
        loadedTotals,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Transaction> transactions)? loadedAll,
    TResult? Function(List<Transaction> transactions)? loadedLimit,
    TResult? Function(TotalsTransaction totalsTransactions)? loadedTotals,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Transaction> transactions)? loadedAll,
    TResult Function(List<Transaction> transactions)? loadedLimit,
    TResult Function(TotalsTransaction totalsTransactions)? loadedTotals,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loadedAll,
    required TResult Function(LoadedLimit value) loadedLimit,
    required TResult Function(LoadedTotals value) loadedTotals,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loadedAll,
    TResult? Function(LoadedLimit value)? loadedLimit,
    TResult? Function(LoadedTotals value)? loadedTotals,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loadedAll,
    TResult Function(LoadedLimit value)? loadedLimit,
    TResult Function(LoadedTotals value)? loadedTotals,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MainState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'MainState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Transaction> transactions) loadedAll,
    required TResult Function(List<Transaction> transactions) loadedLimit,
    required TResult Function(TotalsTransaction totalsTransactions)
        loadedTotals,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Transaction> transactions)? loadedAll,
    TResult? Function(List<Transaction> transactions)? loadedLimit,
    TResult? Function(TotalsTransaction totalsTransactions)? loadedTotals,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Transaction> transactions)? loadedAll,
    TResult Function(List<Transaction> transactions)? loadedLimit,
    TResult Function(TotalsTransaction totalsTransactions)? loadedTotals,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loadedAll,
    required TResult Function(LoadedLimit value) loadedLimit,
    required TResult Function(LoadedTotals value) loadedTotals,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loadedAll,
    TResult? Function(LoadedLimit value)? loadedLimit,
    TResult? Function(LoadedTotals value)? loadedTotals,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loadedAll,
    TResult Function(LoadedLimit value)? loadedLimit,
    TResult Function(LoadedTotals value)? loadedTotals,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements MainState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Transaction> transactions});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_$LoadedImpl(
      null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements Loaded {
  const _$LoadedImpl(final List<Transaction> transactions)
      : _transactions = transactions;

  final List<Transaction> _transactions;
  @override
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'MainState.loadedAll(transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Transaction> transactions) loadedAll,
    required TResult Function(List<Transaction> transactions) loadedLimit,
    required TResult Function(TotalsTransaction totalsTransactions)
        loadedTotals,
    required TResult Function(String message) error,
  }) {
    return loadedAll(transactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Transaction> transactions)? loadedAll,
    TResult? Function(List<Transaction> transactions)? loadedLimit,
    TResult? Function(TotalsTransaction totalsTransactions)? loadedTotals,
    TResult? Function(String message)? error,
  }) {
    return loadedAll?.call(transactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Transaction> transactions)? loadedAll,
    TResult Function(List<Transaction> transactions)? loadedLimit,
    TResult Function(TotalsTransaction totalsTransactions)? loadedTotals,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loadedAll != null) {
      return loadedAll(transactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loadedAll,
    required TResult Function(LoadedLimit value) loadedLimit,
    required TResult Function(LoadedTotals value) loadedTotals,
    required TResult Function(Error value) error,
  }) {
    return loadedAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loadedAll,
    TResult? Function(LoadedLimit value)? loadedLimit,
    TResult? Function(LoadedTotals value)? loadedTotals,
    TResult? Function(Error value)? error,
  }) {
    return loadedAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loadedAll,
    TResult Function(LoadedLimit value)? loadedLimit,
    TResult Function(LoadedTotals value)? loadedTotals,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadedAll != null) {
      return loadedAll(this);
    }
    return orElse();
  }
}

abstract class Loaded implements MainState {
  const factory Loaded(final List<Transaction> transactions) = _$LoadedImpl;

  List<Transaction> get transactions;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedLimitImplCopyWith<$Res> {
  factory _$$LoadedLimitImplCopyWith(
          _$LoadedLimitImpl value, $Res Function(_$LoadedLimitImpl) then) =
      __$$LoadedLimitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Transaction> transactions});
}

/// @nodoc
class __$$LoadedLimitImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$LoadedLimitImpl>
    implements _$$LoadedLimitImplCopyWith<$Res> {
  __$$LoadedLimitImplCopyWithImpl(
      _$LoadedLimitImpl _value, $Res Function(_$LoadedLimitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_$LoadedLimitImpl(
      null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ));
  }
}

/// @nodoc

class _$LoadedLimitImpl implements LoadedLimit {
  const _$LoadedLimitImpl(final List<Transaction> transactions)
      : _transactions = transactions;

  final List<Transaction> _transactions;
  @override
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'MainState.loadedLimit(transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedLimitImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedLimitImplCopyWith<_$LoadedLimitImpl> get copyWith =>
      __$$LoadedLimitImplCopyWithImpl<_$LoadedLimitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Transaction> transactions) loadedAll,
    required TResult Function(List<Transaction> transactions) loadedLimit,
    required TResult Function(TotalsTransaction totalsTransactions)
        loadedTotals,
    required TResult Function(String message) error,
  }) {
    return loadedLimit(transactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Transaction> transactions)? loadedAll,
    TResult? Function(List<Transaction> transactions)? loadedLimit,
    TResult? Function(TotalsTransaction totalsTransactions)? loadedTotals,
    TResult? Function(String message)? error,
  }) {
    return loadedLimit?.call(transactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Transaction> transactions)? loadedAll,
    TResult Function(List<Transaction> transactions)? loadedLimit,
    TResult Function(TotalsTransaction totalsTransactions)? loadedTotals,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loadedLimit != null) {
      return loadedLimit(transactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loadedAll,
    required TResult Function(LoadedLimit value) loadedLimit,
    required TResult Function(LoadedTotals value) loadedTotals,
    required TResult Function(Error value) error,
  }) {
    return loadedLimit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loadedAll,
    TResult? Function(LoadedLimit value)? loadedLimit,
    TResult? Function(LoadedTotals value)? loadedTotals,
    TResult? Function(Error value)? error,
  }) {
    return loadedLimit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loadedAll,
    TResult Function(LoadedLimit value)? loadedLimit,
    TResult Function(LoadedTotals value)? loadedTotals,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadedLimit != null) {
      return loadedLimit(this);
    }
    return orElse();
  }
}

abstract class LoadedLimit implements MainState {
  const factory LoadedLimit(final List<Transaction> transactions) =
      _$LoadedLimitImpl;

  List<Transaction> get transactions;
  @JsonKey(ignore: true)
  _$$LoadedLimitImplCopyWith<_$LoadedLimitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedTotalsImplCopyWith<$Res> {
  factory _$$LoadedTotalsImplCopyWith(
          _$LoadedTotalsImpl value, $Res Function(_$LoadedTotalsImpl) then) =
      __$$LoadedTotalsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TotalsTransaction totalsTransactions});

  $TotalsTransactionCopyWith<$Res> get totalsTransactions;
}

/// @nodoc
class __$$LoadedTotalsImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$LoadedTotalsImpl>
    implements _$$LoadedTotalsImplCopyWith<$Res> {
  __$$LoadedTotalsImplCopyWithImpl(
      _$LoadedTotalsImpl _value, $Res Function(_$LoadedTotalsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalsTransactions = null,
  }) {
    return _then(_$LoadedTotalsImpl(
      null == totalsTransactions
          ? _value.totalsTransactions
          : totalsTransactions // ignore: cast_nullable_to_non_nullable
              as TotalsTransaction,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TotalsTransactionCopyWith<$Res> get totalsTransactions {
    return $TotalsTransactionCopyWith<$Res>(_value.totalsTransactions, (value) {
      return _then(_value.copyWith(totalsTransactions: value));
    });
  }
}

/// @nodoc

class _$LoadedTotalsImpl implements LoadedTotals {
  const _$LoadedTotalsImpl(this.totalsTransactions);

  @override
  final TotalsTransaction totalsTransactions;

  @override
  String toString() {
    return 'MainState.loadedTotals(totalsTransactions: $totalsTransactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedTotalsImpl &&
            (identical(other.totalsTransactions, totalsTransactions) ||
                other.totalsTransactions == totalsTransactions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalsTransactions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedTotalsImplCopyWith<_$LoadedTotalsImpl> get copyWith =>
      __$$LoadedTotalsImplCopyWithImpl<_$LoadedTotalsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Transaction> transactions) loadedAll,
    required TResult Function(List<Transaction> transactions) loadedLimit,
    required TResult Function(TotalsTransaction totalsTransactions)
        loadedTotals,
    required TResult Function(String message) error,
  }) {
    return loadedTotals(totalsTransactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Transaction> transactions)? loadedAll,
    TResult? Function(List<Transaction> transactions)? loadedLimit,
    TResult? Function(TotalsTransaction totalsTransactions)? loadedTotals,
    TResult? Function(String message)? error,
  }) {
    return loadedTotals?.call(totalsTransactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Transaction> transactions)? loadedAll,
    TResult Function(List<Transaction> transactions)? loadedLimit,
    TResult Function(TotalsTransaction totalsTransactions)? loadedTotals,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loadedTotals != null) {
      return loadedTotals(totalsTransactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loadedAll,
    required TResult Function(LoadedLimit value) loadedLimit,
    required TResult Function(LoadedTotals value) loadedTotals,
    required TResult Function(Error value) error,
  }) {
    return loadedTotals(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loadedAll,
    TResult? Function(LoadedLimit value)? loadedLimit,
    TResult? Function(LoadedTotals value)? loadedTotals,
    TResult? Function(Error value)? error,
  }) {
    return loadedTotals?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loadedAll,
    TResult Function(LoadedLimit value)? loadedLimit,
    TResult Function(LoadedTotals value)? loadedTotals,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadedTotals != null) {
      return loadedTotals(this);
    }
    return orElse();
  }
}

abstract class LoadedTotals implements MainState {
  const factory LoadedTotals(final TotalsTransaction totalsTransactions) =
      _$LoadedTotalsImpl;

  TotalsTransaction get totalsTransactions;
  @JsonKey(ignore: true)
  _$$LoadedTotalsImplCopyWith<_$LoadedTotalsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'MainState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Transaction> transactions) loadedAll,
    required TResult Function(List<Transaction> transactions) loadedLimit,
    required TResult Function(TotalsTransaction totalsTransactions)
        loadedTotals,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Transaction> transactions)? loadedAll,
    TResult? Function(List<Transaction> transactions)? loadedLimit,
    TResult? Function(TotalsTransaction totalsTransactions)? loadedTotals,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Transaction> transactions)? loadedAll,
    TResult Function(List<Transaction> transactions)? loadedLimit,
    TResult Function(TotalsTransaction totalsTransactions)? loadedTotals,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loadedAll,
    required TResult Function(LoadedLimit value) loadedLimit,
    required TResult Function(LoadedTotals value) loadedTotals,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loadedAll,
    TResult? Function(LoadedLimit value)? loadedLimit,
    TResult? Function(LoadedTotals value)? loadedTotals,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loadedAll,
    TResult Function(LoadedLimit value)? loadedLimit,
    TResult Function(LoadedTotals value)? loadedTotals,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements MainState {
  const factory Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
