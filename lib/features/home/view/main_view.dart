import '../../../core/utils/alerts/alerts.dart';
import '../../transaction/logic/transaction_cubit/transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/main_bloc/main_cubit.dart';
import 'widgets/widgets.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();

    // add listener userStream
    context.read<MainCubit>().userStream.listen((_) {
      context.read<MainCubit>().getAll().then((_) {
        context.read<MainCubit>().getTotals();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionCubit, TransactionState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (message) => _success(context, message),
          error: (message) => Alerts.showToastMsg(context, message),
          orElse: () {},
        );
      },
      child: _buildBody(),
    );
  }

  _buildBody() {
    return const SafeArea(
      child: Center(
        child: Column(
          children: [
            HeaderAppBar(),
            SizedBox(height: 20),
            ExpenseCard(),
            SizedBox(height: 5),
            HeaderTransaction(),
            AllTransaction(),
          ],
        ),
      ),
    );
  }

  _success(BuildContext context, String message) {
    context.read<MainCubit>().getAll().then((_) {
      context.read<MainCubit>().getTotals();
    });
    Alerts.showToastMsg(context, message);
  }
}
