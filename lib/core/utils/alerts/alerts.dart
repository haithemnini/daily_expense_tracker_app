import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../../extension/extension.dart';

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

  static Future<DateTime?> showPickeTransactionDate({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    required Function(DateTime) onDateSelected,
  }) {
    return showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    ).then((DateTime? newDate) {
      if (newDate != null) {
        onDateSelected(newDate);
      }
      return newDate;
    });
  }

  static Future<void> showLoaderDialog(
    BuildContext context,
  ) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => PopScope(
          canPop: false,
          child: Align(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 150, maxHeight: 120),
              child: AlertDialog(
                elevation: 0,
                contentPadding: EdgeInsets.zero,
                content: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      context.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  static void hideLoaderDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static void showToastMsg(BuildContext context, String message) {
    showToast(
      message,
      context: context,
      animation: StyledToastAnimation.fade,
      position: const StyledToastPosition(
        align: Alignment.bottomCenter,
        offset: 100.0,
      ),
      reverseAnimation: StyledToastAnimation.fade,
      borderRadius: const BorderRadius.all(Radius.circular(32.0)),
      textStyle: const TextStyle(color: Colors.white, fontSize: 12),
    );
  }

  static void showAlertDialog({
    required BuildContext context,
    required String title,
    required String message,
    required Function() onOk,
    Function()? onCancel,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                onOk();
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
            if (onCancel != null)
              TextButton(
                onPressed: () {
                  onCancel();
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
          ],
        );
      },
    );
  }
}
