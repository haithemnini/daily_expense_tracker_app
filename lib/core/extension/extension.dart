import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../enum/enum.dart';
import '../models/transaction_hive_model.dart';

/// Extension on [BuildContext] build context to provide easy access Context Extension.
extension DevicesContextExtension on BuildContext {
  // Returns the current [ThemeData] of the [BuildContext].
  ThemeData get _theme => Theme.of(this);

  // Calculates the screen height based on the current [BuildContext] and a given value.
  double screenHeight(double value) => ScreenUtil().screenHeight * value;

  // Calculates the screen width based on the current [BuildContext] and a given value.
  double screenWidth(double value) => ScreenUtil().screenWidth * value;

  // Returns the [TextTheme] of the current [BuildContext]'s theme.
  TextTheme get textTheme => _theme.textTheme;

  // Returns the [ColorScheme] of the current [BuildContext]'s theme.
  ColorScheme get colorScheme => _theme.colorScheme;

  // Returns the size of the current [BuildContext]'s device.
  Size get deviceSize => MediaQuery.sizeOf(this);

  // Returns the width of the current [BuildContext]'s device.
  double get deviceWidth => deviceSize.width;
}

extension TransactionCategoryExtension on TransactionCategory {
  TransactionCategory get transactionCategoryHive {
    switch (this) {
      case TransactionCategory.income:
        return TransactionCategory.income;
      case TransactionCategory.expense:
        return TransactionCategory.expense;
    }
  }
}

extension TransactionTypeHiveExtension on TransactionCategoryHive {
  TransactionCategory get transactionCategory {
    switch (this) {
      case TransactionCategoryHive.income:
        return TransactionCategory.income;
      case TransactionCategoryHive.expense:
        return TransactionCategory.expense;
    }
  }
}

extension DateFormattingExtension on DateTime {
  String get formattedDate => DateFormat.yMMMd().format(this);
  String get formatDynamicDate {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final formatted = DateFormat.yMMMd().format(this);
    if (isAtSameMomentAs(today)) {
      return 'Today';
    } else if (isAtSameMomentAs(yesterday)) {
      return 'Yesterday';
    } else {
      return formatted;
    }
  }
}

extension DoubleFormatting on double {
  String toFormattedCurrencyStringWithSymbol() {
    final formatter = NumberFormat.currency(symbol: '\$ ', decimalDigits: 2);
    return formatter.format(this);
  }

  String toFormattedCurrencyString() {
    final formatter = NumberFormat.currency(symbol: '', decimalDigits: 2);
    return formatter.format(this);
  }
}

extension StringFormatting on String {
  double toUnFormattedString() {
    return double.parse(replaceAll(',', ''));
  }
}
