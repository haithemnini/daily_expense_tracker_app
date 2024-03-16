import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enum/enum.dart';
import '../../../core/router/app_route.dart';
import '../../../core/router/router.dart';
import '../../../core/shared/shared.dart';
import '../../../core/styles/app_text_style.dart';
import '../../../core/utils/alerts/alerts.dart';
import '../../blocs/main_bloc/main_cubit.dart';
import '../../blocs/transaction_bloc/transaction_cubit.dart';
import 'widgets/widgets.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    context
        .read<MainCubit>()
        .getAll(TypeShow.limit)
        .then((_) => context.read<MainCubit>().getTotals());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            children: [
              const BlocListenerAuth(),
              const SizedBox(height: 10.0),
              const HeaderAppBarProfile(),
              const SizedBox(height: 10.0),
              const ExpenseCard(),
              _buildHeaderTransaction(),
              BlocListener<TransactionCubit, TransactionState>(
                listener: (_, state) => state.maybeWhen(
                  success: (message) => _success(context, message),
                  error: (message) => Alerts.showToastMsg(context, message),
                  orElse: () => {},
                ),
                child: const SizedBox.shrink(),
              ),
              BlocBuilder<MainCubit, MainState>(
                buildWhen: (previous, current) => current.maybeWhen(
                  loadedAll: (_) => true,
                  loadedLimit: (_) => true,
                  loading: () => true,
                  orElse: () => false,
                ),
                builder: (_, state) => state.maybeWhen(
                  loadedLimit: (transactions) => TransactionList(
                    allTransactions: transactions,
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  orElse: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildHeaderTransaction() {
    return Row(
      children: [
        const Text(
          'Transaction',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        TextButton(
          child: Text(
            'View All',
            style: AppTextStyle.caption.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          onPressed: () => context.pushNamed(RoutesName.allViewTransaction),
        ),
      ],
    );
  }

  _success(BuildContext context, String message) {
    Alerts.showToastMsg(context, message);
    context
        .read<MainCubit>()
        .getAll(TypeShow.limit)
        .then((_) => context.read<MainCubit>().getTotals());
  }
}
