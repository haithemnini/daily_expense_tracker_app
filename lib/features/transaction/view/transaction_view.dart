import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router/router.dart';
import '../../../core/shared/custom_material_button.dart';
import '../../../core/shared/shared.dart';
import '../../../core/utils/alerts/alerts.dart';
import '../../blocs/transaction_bloc/transaction_cubit.dart';
import 'widgets/widgets.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocListener<TransactionCubit, TransactionState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        loading: () => Alerts.showLoaderDialog(context),
                        success: (message) => _success(context, message),
                        error: (message) {
                          Alerts.showToastMsg(context, message);
                        },
                        orElse: () => {},
                      );
                    },
                    child: const SizedBox.shrink(),
                  ),
                  const Spacer(),
                  const SizedBox(height: 30),
                  const TransactionForm(),
                  const Spacer(),
                  CustomMaterialButton(
                    text: 'SAVE',
                    onPressed: () => context
                        .read<TransactionCubit>()
                        .addOrUpdateTransaction(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _success(BuildContext context, String message) {
    Alerts.hideLoaderDialog(context);
    Alerts.showToastMsg(context, message);
    context.pop();
  }
}
