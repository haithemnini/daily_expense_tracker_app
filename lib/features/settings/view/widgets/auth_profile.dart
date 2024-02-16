import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/helper/helper.dart';
import '../../../../core/router/app_route.dart';
import '../../../../core/router/router.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_style.dart';

class AuthProfile extends StatelessWidget {
  const AuthProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.pushNamed(RoutesName.profile),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                gradient: AppColors.primaryGradient,
              ),
              child: Container(
                margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(
                      Helper.getAssetImage('profile.png'),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('John Doe', style: AppTextStyle.title),
                const SizedBox(height: 5),
                Text(
                  'Edit Personal Info',
                  style: AppTextStyle.caption.copyWith(
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.outline,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const FaIcon(FontAwesomeIcons.chevronRight, size: 18),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
