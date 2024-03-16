import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../enum/enum.dart';
import '../models/transaction_hive_model.dart';

/// Extension on [BuildContext] build context to provide easy access Context Extension.
extension DevicesOsContextExtension on BuildContext {
  // Returns the current [ThemeData] of the [BuildContext].
  ThemeData get _theme => Theme.of(this);

  // Calculates the screen height based on the current [BuildContext] and a given value.
  double screenHeight(double value) => MediaQuery.of(this).size.height * value;

  // Calculates the screen width based on the current [BuildContext] and a given value.
  double screenWidth(double value) => MediaQuery.of(this).size.width * value;

  // Returns the [TextTheme] of the current [BuildContext]'s theme.
  TextTheme get textTheme => _theme.textTheme;

  // Returns the [ColorScheme] of the current [BuildContext]'s theme.
  ColorScheme get colorScheme => _theme.colorScheme;

  // Returns the size of the current [BuildContext]'s device.
  Size get deviceSize => MediaQuery.sizeOf(this);

  // Returns the width of the current [BuildContext]'s device.
  double get deviceWidth => deviceSize.width;
}

extension CategoryExtension on Category {
  Category get categoryHive {
    switch (this) {
      case Category.income:
        return Category.income;
      case Category.expense:
        return Category.expense;
    }
  }
}

extension TransactionTypeHiveExtension on CategoryHive {
  Category get category {
    switch (this) {
      case CategoryHive.income:
        return Category.income;
      case CategoryHive.expense:
        return Category.expense;
    }
  }
}

extension DateExtension on DateTime {
  String get formattedDate {
    //e.g. 12th Jan 2021 at 12:00 PM
    return '${DateFormat.yMMMd().format(this)} at ${DateFormat.jm().format(this)}';
  }

  String get formattedDateOnly {
    //e.g. Jan 12, 2021
    return DateFormat.yMMMd().format(this);
  }

  String get formattedDateOnlyShort {
    //e.g. Jan 12
    return DateFormat.MMMd().format(this);
  }

  DateTime get dateOnly => DateTime(year, month, day);

  String get formatDynamicDate {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final updatedDate = DateTime(year, month, day);

    if (today.isAtSameMomentAs(updatedDate)) {
      // If the date is today, return "Today at <time>"
      //e.g. Today, 12:00 PM
      return 'Today, ${DateFormat.jm().format(this)}';
    } else if (yesterday.isAtSameMomentAs(updatedDate)) {
      // If the date is yesterday, return "Yesterday at <time>"
      //e.g. Yesterday, 12:00 PM
      return 'Yesterday, ${DateFormat.jm().format(this)}';
    } else {
      if (year == now.year) {
        // If the date is in the current year, return "MMM d at <time>"
        //e.g. Jan 12, 12:00 PM
        return '${DateFormat.MMMd().format(this)}, ${DateFormat.jm().format(this)}';
      } else {
        // Otherwise, return "MMM d, yyyy at <time>"
        //e.g. Jan 12, 2021 at 12:00 PM
        return '${DateFormat.yMMMd().format(this)} at ${DateFormat.jm().format(this)}';
      }
    }
  }
}

extension DoubleFormatting on double {
  String toCurrencyWithSymbol() {
    final formatter = NumberFormat.currency(symbol: '\$ ', decimalDigits: 2);
    return formatter.format(this);
  }

  String toCurrencyString() {
    final formatter = NumberFormat.currency(symbol: '', decimalDigits: 2);
    return formatter.format(this);
  }
}

extension StringFormatting on String {
  double toUnFormattedString() {
    return double.parse(replaceAll(',', ''));
  }
}
