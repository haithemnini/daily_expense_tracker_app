import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/enum/enum.dart';
import '../../../core/extension/extension.dart';
import '../../../core/router/app_route.dart';
import '../../../core/router/router.dart';
import '../../../core/styles/app_colors.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({
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
      child: SpeedDial(
        elevation: 0,
        overlayOpacity: 0.5,
        backgroundColor: Colors.transparent,
        overlayColor: Colors.black.withOpacity(0.5),
        icon: FontAwesomeIcons.plus,
        activeIcon: FontAwesomeIcons.xmark,
        activeBackgroundColor: Colors.transparent,
        activeForegroundColor: Colors.transparent,
        direction: SpeedDialDirection.up,
        spacing: 10,
        children: [
          SpeedDialChild(
            child: const Icon(FontAwesomeIcons.arrowUp, size: 18),
            backgroundColor: context.colorScheme.surface,
            foregroundColor: context.colorScheme.onSurface,
            shape: const CircleBorder(),
            onTap: () {
              // print('Add Expense');
              context.pushNamed(
                RoutesName.transaction,
                arguments: TransactionType.addExpense,
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(FontAwesomeIcons.arrowDown, size: 18),
            backgroundColor: context.colorScheme.surface,
            foregroundColor: context.colorScheme.onSurface,
            shape: const CircleBorder(),
            onTap: () {
              // print('Add Icome');
              context.pushNamed(
                RoutesName.transaction,
                arguments: TransactionType.addIncome,
              );
            },
          ),
        ],
      ),
    );
  }
}
