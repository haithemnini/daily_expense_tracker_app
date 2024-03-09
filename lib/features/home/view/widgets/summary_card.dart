import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/models/transaction_model.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../blocs/state_bloc/state_cubit.dart';
import 'widgets.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StateCubit, StateState>(
      builder: (context, state) {
        final startDate = state.maybeMap(
          initial: (state) => context.read<StateCubit>().startDate,
          dateChanged: (state) => state.startDate,
          orElse: () => context.read<StateCubit>().startDate,
        );

        final endDate = state.maybeMap(
          initial: (state) => context.read<StateCubit>().endDate,
          dateChanged: (state) => state.endDate,
          orElse: () => context.read<StateCubit>().endDate,
        );

        final List<Transaction>? allTransactions = state.mapOrNull(
          loaded: (state) => state.transactions,
        );

        return Container(
          height: context.screenHeight(0.4),
          width: context.screenWidth(0.9),
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Text(
                {
                  endDate.formattedDateOnly,
                  startDate.formattedDateOnly,
                }.join(' - '),
                style: AppTextStyle.caption.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                allTransactions?.toCalcTotals().amount.toCurrencyWithSymbol() ??
                    '0.00',
                style: AppTextStyle.title3,
              ),
              const SizedBox(height: 10.0),
              BlocBuilder<StateCubit, StateState>(
                builder: (context, state) {
                  return state.maybeMap(
                    loaded: (loaded) => StateBarChart(
                      chartData: loaded.chartData,
                    ),
                    loading: (_) => StateBarChart(
                      chartData: {DateTime.now(): 0.0},
                    ),
                    error: (error) => Center(child: Text(error.message)),
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
