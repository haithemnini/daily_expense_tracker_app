import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../enums/enums.dart';
import '../extensions/extensions.dart';
import '../helpers/show_modal_sheet_helpers.dart';
import '../routing/routing.dart';
import 'item_button.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) {
          return _buildTransactionItem(context);
        },
      ),
    );
  }

  _buildTransactionItem(BuildContext context) {
    return ItemButton(
      text: 'Shopping',
      icon: FontAwesomeIcons.bagShopping,
      iconColor: Colors.white,
      backgroundItem: context.colorScheme.surface,
      backgroundIcon: Colors.redAccent,
      onLongPress: () => _showModalSheet(context),
      trailing: _buildTrailing(context),
    );
  }

  Widget _buildTrailing(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          '-\$ 4800.00',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Today',
          style: TextStyle(
            fontSize: 12,
            color: context.colorScheme.outline,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  void _showModalSheet(BuildContext context) {
    return showModalSheetHelpers(
      context: context,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
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
                onPressed: () => context.pop(),
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
      arguments: TransactionType.editExpense,
    );
  }
}
