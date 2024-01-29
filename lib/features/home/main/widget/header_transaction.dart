import '../../../../core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class HeaderTransaction extends StatelessWidget {
  const HeaderTransaction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Transaction',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'View All',
            style: AppTextStyle.caption.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
