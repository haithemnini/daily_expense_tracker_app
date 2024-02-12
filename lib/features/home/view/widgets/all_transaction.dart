import 'package:daily_expense_tracker_app/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/shared.dart';
import '../../logic/main_bloc/main_cubit.dart';

class AllTransaction extends StatelessWidget {
  const AllTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (previous, current) => current is Loaded,
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (transactions) => TransactionList(
            allTransactions: transactions,
          ),
          orElse: () => Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                context.colorScheme.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}
