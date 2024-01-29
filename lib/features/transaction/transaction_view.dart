import 'package:flutter/material.dart';

import '../../core/enum/enum.dart';
import '../../core/shared/custom_material_button.dart';
import '../../core/shared/shared.dart';
import '../../core/styles/app_text_style.dart';
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
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: _buildBody(context),
      ),
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
                _buildTextSelected(context),
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

  Text _buildTextSelected(BuildContext context) {
    String transactionText;

    switch (transaction) {
      case TransactionType.addExpense:
        transactionText = 'Add Expense';
        break;
      case TransactionType.addIncome:
        transactionText = 'Add Income';
        break;
      case TransactionType.editExpense:
        transactionText = 'Edit Expense';
        break;
      case TransactionType.editIncome:
        transactionText = 'Edit Income';
        break;
    }

    return Text(
      transactionText,
      style: AppTextStyle.title4,
    );
  }
}
