import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enum/enum.dart';
import '../../../core/router/router.dart';
import '../../../core/shared/shared.dart';
import '../../blocs/main_bloc/main_cubit.dart';
import '../../blocs/transaction_bloc/transaction_cubit.dart';

class AllViewTransaction extends StatefulWidget {
  const AllViewTransaction({super.key});

  @override
  State<AllViewTransaction> createState() => _AllViewTransactionState();
}

class _AllViewTransactionState extends State<AllViewTransaction> {
  @override
  void initState() {
    super.initState();
    context.read<MainCubit>().getAll(TypeShow.all);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'All Transaction',
        onPressed: () => _onRefresh(),
      ),
      body: _buidBody(),
    );
  }

  Widget _buidBody() {
    return PopScope(
      canPop: true,
      onPopInvoked: (_) => {
        context.read<MainCubit>().getAll(TypeShow.limit),
        context.read<MainCubit>().getTotals(),
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocListener<TransactionCubit, TransactionState>(
                listenWhen: (previous, current) => current is Success,
                listener: (_, state) => state.maybeWhen(
                  success: (_) => _success(context),
                  orElse: () => {},
                ),
                child: const SizedBox.shrink(),
              ),
              BlocBuilder<MainCubit, MainState>(
                buildWhen: (previous, current) => current is Loaded,
                builder: (_, state) => state.maybeWhen(
                  loadedAll: (transactions) => TransactionList(
                    allTransactions: transactions,
                  ),
                  orElse: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onRefresh() {
    context.read<MainCubit>().getAll(TypeShow.limit);
    context.read<MainCubit>().getTotals();

    return context.pop();
  }

  void _success(BuildContext context) {
    context.read<MainCubit>().getAll(TypeShow.all);
  }
}
