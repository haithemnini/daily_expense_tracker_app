import 'dart:math';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            context.colorScheme.tertiary,
            context.colorScheme.secondary,
            context.colorScheme.primary,
          ],
          transform: const GradientRotation(pi / 4),
        ),
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
              debugPrint('Add Icome');
              // Navigator.of(context).pushNamed(
              //   AppRoutes.addIncomeScreen,
              // );
            },
          ),
          SpeedDialChild(
            child: const Icon(FontAwesomeIcons.arrowDown, size: 18),
            backgroundColor: context.colorScheme.surface,
            foregroundColor: context.colorScheme.onSurface,
            shape: const CircleBorder(),
            onTap: () {
              debugPrint('Add Icome');
              // Navigator.of(context).pushNamed(
              //   AppRoutes.addExpenseScreen,
              // );
            },
          ),
        ],
      ),
    );
  }
}
