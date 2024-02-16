import 'package:daily_expense_tracker_app/core/extension/extension.dart';
import 'package:daily_expense_tracker_app/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/router/app_route.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../transaction/logic/transaction_cubit/transaction_cubit.dart';

class AppFloatingButton extends StatelessWidget {
  const AppFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.primaryGradient,
      ),
      child: IconButton(
        icon: Icon(FontAwesomeIcons.plus, color: context.colorScheme.surface),
        onPressed: () {
          context.read<TransactionCubit>().isEditing = false;
          context.pushNamed(RoutesName.transaction);
        },
      ),
    );
  }
}
