import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enum/enum.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/models/transaction_model.dart';
import '../../../../core/shared/shared.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../blocs/state_bloc/state_cubit.dart';
import 'widgets.dart';

class TransactionFilter extends StatefulWidget {
  const TransactionFilter({super.key, required this.category});

  final Category category;

  @override
  State<TransactionFilter> createState() => _TransactionFilterState();
}

class _TransactionFilterState extends State<TransactionFilter> {
  @override
  void initState() {
    super.initState();
    context.read<StateCubit>().getStat(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          const SummaryCard(),
          const SizedBox(height: 10),
          _buidlHeaderText(context),
          const SizedBox(height: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [_buildTransactionList(context)],
            ),
          ),
        ],
      ),
    );
  }

  _buidlHeaderText(BuildContext context) {
    return BlocBuilder<StateCubit, StateState>(
      builder: (context, state) {
        final List<Transaction>? allTransactions = state.mapOrNull(
          loaded: (state) => state.transactions,
        );
        final endDate = state.maybeMap(
          initial: (state) => context.read<StateCubit>().endDate,
          dateChanged: (state) => state.endDate,
          orElse: () => context.read<StateCubit>().endDate,
        );
        return Row(
          children: [
            Text(
              endDate.formattedDateOnly,
              style: AppTextStyle.caption.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Text(
              allTransactions?.toCalcTotals().amount.toCurrencyWithSymbol() ??
                  '0.00',
              style: AppTextStyle.caption.copyWith(
                fontWeight: FontWeight.w600,
                color: widget.category == Category.expense
                    ? Colors.redAccent
                    : Colors.greenAccent,
              ),
            ),
          ],
        );
      },
    );
  }

  _buildTransactionList(BuildContext context) {
    return BlocBuilder<StateCubit, StateState>(
      buildWhen: (previous, current) {
        return current.maybeWhen(
          loaded: (transactions, _) => true,
          loading: () => true,
          orElse: () => false,
        );
      },
      builder: (context, state) {
        final List<Transaction>? allTransactions = state.mapOrNull(
          loaded: (state) => state.transactions,
        );

        return state.maybeWhen(
          loaded: (transactions, _) {
            return allTransactions!.isEmpty
                ? Center(
                    child: Text(
                      'No transactions yet',
                      style: AppTextStyle.subtitle.copyWith(
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                  )
                : TransactionList(
                    allTransactions: allTransactions,
                    isViewOnly: true,
                  );
          },
          orElse: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
