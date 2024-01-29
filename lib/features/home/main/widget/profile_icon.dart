import 'package:daily_expense_tracker_app/core/helper/helper.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/styles/app_text_style.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                Helper.getAssetImage('profile.png'),
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome !',
              style: AppTextStyle.caption.copyWith(
                color: context.colorScheme.outline,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'John Doe',
              style: AppTextStyle.subtitle.copyWith(
                color: context.colorScheme.onBackground,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
