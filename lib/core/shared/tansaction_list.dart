import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../enum/enum.dart';
import '../extension/extension.dart';
import '../models/transaction_model.dart';
import '../router/app_route.dart';
import '../router/router.dart';
import '../styles/app_text_style.dart';
import '../utils/alerts/alerts.dart';
import 'item_button.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key, required this.allTransactions});

  final List<TransactionModel> allTransactions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: allTransactions.length,
        itemBuilder: (_, index) {
          final transaction = allTransactions[index];
          final category = Categorys.fromIndex(transaction.categoryIndex);
          return _buildTransactionItem(context, transaction, category);
        },
      ),
    );
  }

  ItemButton _buildTransactionItem(
    BuildContext context,
    TransactionModel transaction,
    Categorys category,
  ) {
    return ItemButton(
      text: category.name,
      icon: category.icon,
      iconColor: Colors.white,
      backgroundItem: context.colorScheme.surface,
      backgroundIcon: category.backgroundIcon,
      onLongPress: () => _showModalSheet(context),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '\$ ${transaction.amount.toStringAsFixed(2)}',
            style: AppTextStyle.subtitle.copyWith(
              color: transaction.transactionType == TransactionType.expense
                  ? Colors.redAccent
                  : Colors.greenAccent,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            transaction.date.formatDate(),
            style: AppTextStyle.caption.copyWith(
              color: context.colorScheme.outline,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  void _showModalSheet(BuildContext context) {
    return Alerts.showSheet(
      context: context,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ItemButton(
                text: 'Edit',
                icon: FontAwesomeIcons.penToSquare,
                iconColor: Colors.white,
                backgroundIcon: Colors.blueAccent,
                backgroundItem: Colors.transparent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                onPressed: () => _onPressed(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ItemButton(
                text: 'Delete',
                icon: FontAwesomeIcons.trashCan,
                iconColor: Colors.white,
                backgroundIcon: Colors.redAccent,
                backgroundItem: Colors.transparent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                onPressed: () => _onPressedDelete(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressed(BuildContext context) {
    context.pop();
    context.pushNamed(
      RoutesName.transaction,
      arguments: Transaction.editExpense,
    );
  }

  void _onPressedDelete(BuildContext context) {
    context.pop();
  }
}

extension DateTimeExtension on DateTime {
  String formatDate() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      // أيام الأسبوع
      return DateFormat('EEEE').format(this);
    } else {
      // تاريخ غير محدد، يمكن استخدام تاريخ المنجهية
      return DateFormat('dd/MM/yyyy').format(this);
    }
  }
}
