import 'package:flutter/material.dart';

import '../extensions/extensions.dart';

void showModalSheetHelpers({
  required BuildContext context,
  required Widget child,
  double? heigh,
}) {
  showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    clipBehavior: Clip.antiAlias,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(32),
      ),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        width: context.screenWidth(0.92),
        height: heigh,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHandle(context),
            child,
          ],
        ),
      );
    },
  );
}

Widget _buildHandle(BuildContext context) {
  final theme = Theme.of(context);

  return FractionallySizedBox(
    widthFactor: 0.08,
    child: Container(
      margin: const EdgeInsets.symmetric(
        vertical: 12.0,
      ),
      child: Container(
        height: 5.0,
        decoration: BoxDecoration(
          color: theme.dividerColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(2.5),
          ),
        ),
      ),
    ),
  );
}
