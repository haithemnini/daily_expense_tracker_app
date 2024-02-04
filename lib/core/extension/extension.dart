import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

extension TransactionTypeExtension on TransactionType {
  TransactionTypeHive get transactionTypeHive {
    switch (this) {
      case TransactionType.income:
        return TransactionTypeHive.income;
      case TransactionType.expense:
        return TransactionTypeHive.expense;
    }
  }
}

extension TransactionTypeHiveExtension on TransactionTypeHive {
  TransactionType get transactionType {
    switch (this) {
      case TransactionTypeHive.income:
        return TransactionType.income;
      case TransactionTypeHive.expense:
        return TransactionType.expense;
    }
  }
}
