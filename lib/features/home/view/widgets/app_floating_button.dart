import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/router/app_route.dart';
import '../../../../core/router/router.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../blocs/transaction_bloc/transaction_cubit.dart';

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
