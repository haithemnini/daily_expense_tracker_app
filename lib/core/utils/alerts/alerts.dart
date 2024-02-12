import 'package:daily_expense_tracker_app/core/extension/extension.dart';
import 'package:flutter/material.dart';

class Alerts {
  static void showSheet({
    required BuildContext context,
    required Widget child,
    double? heigh,
  }) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      constraints: BoxConstraints(
        maxHeight: heigh ?? context.deviceSize.height * 0.5,
        maxWidth: context.deviceSize.width * 0.97,
      ),
      isScrollControlled: true,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            child,
          ],
        );
      },
    );
  }
}
