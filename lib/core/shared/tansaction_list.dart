import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../features/transaction/logic/transaction_cubit/transaction_cubit.dart';
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

  final List<Transaction> allTransactions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: allTransactions.isEmpty
          ? Center(
              child: Text(
                'No transactions yet',
                style: AppTextStyle.subtitle.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              ),
            )
          : ListView.builder(
              itemCount: allTransactions.length,
              itemBuilder: (_, index) {
                final transaction = allTransactions[index];
                final category = Categorys.fromIndex(
                  transaction.categorysIndex,
                );
                return _buildTransactionItem(context, transaction, category);
              },
            ),
    );
  }

  ItemButton _buildTransactionItem(
    BuildContext context,
    Transaction transaction,
    Categorys category,
  ) {
    return ItemButton(
      text: category.name,
      icon: category.icon,
      iconColor: Colors.white,
      backgroundItem: context.colorScheme.surface,
      backgroundIcon: category.backgroundIcon,
      onLongPress: () => _showModalSheet(context, transaction),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            transaction.amount.toFormattedCurrencyStringWithSymbol(),
            style: AppTextStyle.subtitle.copyWith(
              color:
                  transaction.transactionCategory == TransactionCategory.expense
                      ? Colors.redAccent
                      : Colors.greenAccent,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            transaction.date.formatDynamicDate,
            style: AppTextStyle.caption.copyWith(
              color: context.colorScheme.outline,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  void _showModalSheet(BuildContext context, Transaction transaction) {
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
                onPressed: () => _onPressedEdit(context, transaction),
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
                onPressed: () => _onPressedDelete(context, transaction),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressedEdit(BuildContext context, Transaction transaction) {
    context.pop();
    context.read<TransactionCubit>().isEditing = true;
    context.read<TransactionCubit>().transaction = transaction;
    context.pushNamed(RoutesName.transaction);
  }

  void _onPressedDelete(BuildContext context, Transaction transaction) {
    context.pop();
    Alerts.showAlertDialog(
      context: context,
      title: 'Delete Transaction',
      message: 'Are you sure you want to delete this transaction?',
      onOk: () {
        debugPrint('transaction.uuid: ${transaction.uuid}');
        context.read<TransactionCubit>().deleteTransaction(transaction.uuid!);
      },
      onCancel: () => {},
    );
  }
}
