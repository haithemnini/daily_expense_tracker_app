import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../core/enum/enum.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/router/router.dart';
import '../../../../core/shared/shared.dart';
import '../../../../core/utils/alerts/alerts.dart';
import '../../../blocs/transaction_bloc/transaction_cubit.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  @override
  void initState() {
    context.read<TransactionCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const iconSize = 16.0;
    const iconItemHeight = 35.0;
    const iconItemWidth = 35.0;
    const padding = EdgeInsets.symmetric(horizontal: 12, vertical: 15);
    final backgroundItem = context.colorScheme.surface;

    return BlocBuilder<TransactionCubit, TransactionState>(
      buildWhen: (previous, current) => current is LoadTransaction,
      builder: (context, state) {
        final categorys = state.mapOrNull(
          loadTransaction: (state) => state.categorys,
        );

        final transactionCategory = state.mapOrNull(
          loadTransaction: (state) => state.transactionCategory,
        );

        final transactionDate = state.mapOrNull(
          loadTransaction: (state) => state.transactionDate,
        );

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildMoneyTextFeild(context),
            const SizedBox(height: 20),
            Column(
              children: [
                CustomItemButton(
                  text: categorys!.name,
                  padding: padding,
                  iconSize: iconSize,
                  iconColor: Colors.white,
                  iconItemWidth: iconItemWidth,
                  iconItemHeight: iconItemHeight,
                  backgroundIcon: categorys.backgroundIcon,
                  backgroundItem: backgroundItem,
                  icon: categorys.icon,
                  onPressed: () => _showModalSheetCategory(context),
                ),
                CustomItemButton(
                  text: transactionCategory!.name,
                  padding: padding,
                  iconSize: iconSize,
                  iconColor: Colors.white,
                  iconItemWidth: iconItemWidth,
                  iconItemHeight: iconItemHeight,
                  backgroundIcon: transactionCategory.backgroundIcon,
                  backgroundItem: backgroundItem,
                  icon: transactionCategory.icon,
                  onPressed: () => _showModalSheetTransactionCategory(context),
                ),
                CustomItemButton(
                  text: transactionDate!.formattedDateOnly,
                  padding: padding,
                  iconSize: iconSize,
                  iconColor: context.colorScheme.surface,
                  iconItemWidth: iconItemWidth,
                  iconItemHeight: iconItemHeight,
                  backgroundIcon: context.colorScheme.outline,
                  backgroundItem: backgroundItem,
                  icon: FontAwesomeIcons.calendarDay,
                  onPressed: () => _showPickeDate(context, transactionDate),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  _buildMoneyTextFeild(BuildContext context) {
    return Container(
      height: 70,
      width: context.screenWidth(0.65),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: context.colorScheme.surface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 18),
          // const Text('\$', style: AppTextStyle.title2),
          Flexible(
            child: CustomTextFormField(
              fontSize: 30,
              maxLines: 1,
              hintText: '0.00',
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w800,
              keyboardType: TextInputType.number,
              contentPadding: const EdgeInsets.only(
                right: 15,
                left: 0,
              ),
              controller: context.read<TransactionCubit>().amountController,
              prefixText: NumberFormat.compactSimpleCurrency(locale: 'en')
                  .currencySymbol,
            ),
          )
        ],
      ),
    );
  }

  void _showModalSheetCategory(BuildContext context) {
    Alerts.showSheet(
      context: context,
      child: Expanded(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: categorys.length,
          itemBuilder: (context, index) {
            final Categorys category = categorys[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomItemButton(
                text: category.name,
                icon: category.icon,
                iconColor: Colors.white,
                backgroundItem: Colors.transparent,
                backgroundIcon: category.backgroundIcon,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                onPressed: () {
                  context.read<TransactionCubit>().onCategorysChanged(category);
                  context.pop();
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _showModalSheetTransactionCategory(BuildContext context) {
    Alerts.showSheet(
      context: context,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: Column(
          children: Category.values.map((transactionCategory) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CustomItemButton(
                text: transactionCategory.name,
                iconColor: Colors.white,
                icon: transactionCategory.icon,
                backgroundIcon: transactionCategory.backgroundIcon,
                backgroundItem: Colors.transparent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                onPressed: () {
                  context
                      .read<TransactionCubit>()
                      .onTransactionCategoryChanged(transactionCategory);

                  context.pop();
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Future<DateTime?> _showPickeDate(
    BuildContext context,
    DateTime initialDate,
  ) {
    return Alerts.showPickeTransactionDate(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
      onDateSelected: (DateTime dateTime) {
        context.read<TransactionCubit>().onTransactionDateChanged(dateTime);
      },
    );
  }
}
