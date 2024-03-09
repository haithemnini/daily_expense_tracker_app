import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/extension/extension.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabTapped,
  });

  final int currentIndex;
  final Function(int) onTabTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.01),
            blurRadius: 5,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: BottomAppBar(
        height: 60,
        elevation: 0,
        notchMargin: 10,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.house, size: 18),
              onPressed: () => onTabTapped(0),
              color: currentIndex == 0
                  ? context.colorScheme.primary
                  : context.colorScheme.outline,
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.chartSimple, size: 18),
              onPressed: () => onTabTapped(1),
              color: currentIndex == 1
                  ? context.colorScheme.primary
                  : context.colorScheme.outline,
            ),
          ],
        ),
      ),
    );
  }
}
