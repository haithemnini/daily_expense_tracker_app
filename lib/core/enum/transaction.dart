import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum TransactionAction {
  add,
  edit,
}

enum TransactionCategory {
  expense(
    name: 'Expense',
    backgroundIcon: Colors.redAccent,
    icon: FontAwesomeIcons.moneyBill,
  ),
  income(
    name: 'Income',
    backgroundIcon: Colors.green,
    icon: FontAwesomeIcons.handHoldingDollar,
  );

  final String name;
  final IconData icon;
  final Color backgroundIcon;

  const TransactionCategory({
    required this.name,
    required this.icon,
    required this.backgroundIcon,
  });

  // static TransactionCategory fromIndex(int categoryIndex) {
  //   return TransactionCategory.values.firstWhere(
  //     (category) => category.index == categoryIndex,
  //     orElse: () => TransactionCategory.expense,
  //   );
  // }
}
