import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum TransactionAction {
  add,
  edit,
}

enum Category {
  expense(
    name: 'Expense',
    backgroundIcon: Colors.redAccent,
    icon: FontAwesomeIcons.minus,
  ),
  income(
    name: 'Income',
    backgroundIcon: Colors.greenAccent,
    icon: FontAwesomeIcons.plus,
  );

  final String name;
  final IconData icon;
  final Color backgroundIcon;

  const Category({
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
