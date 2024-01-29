import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/common/common.dart';
import '../../core/enums/enums.dart';
import '../../core/extensions/extensions.dart';
import 'widgets/widgets.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({
    super.key,
    required this.transaction,
  });

  final TransactionType transaction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: _buildBody(context),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      leading: const SizedBox(),
      systemOverlayStyle: context.systemUiOverlayStyleAppBar(),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: CustomIconBottom(
            onPressed: () => context.pop(),
            icon: FontAwesomeIcons.xmark,
          ),
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                _buidTextSelected(context),
                const SizedBox(height: 30),
                const TransactionForm(),
                const Spacer(),
                CustomMaterialButton(
                  text: 'SAVE',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text _buidTextSelected(BuildContext context) {
    return Text(
      _getSelectedString(transaction),
      style: TextStyle(
        color: context.colorScheme.onBackground,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  _getSelectedString(TransactionType transaction) {
    switch (transaction) {
      case TransactionType.addExpense:
        return 'Add Expense';
      case TransactionType.addIncome:
        return 'Add Income';
      case TransactionType.editExpense:
        return 'Edit Expense';
      case TransactionType.editIncome:
        return 'Edit Income';
    }
  }
}
