import 'package:flutter/material.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/shared/shared.dart';
import '../../../../core/styles/app_text_style.dart';

class ItemSettings extends StatelessWidget {
  const ItemSettings({
    super.key,
    required this.title,
    required this.iconData,
    required this.trailing,
    required this.backgroundIcon,
    this.onTap,
  });

  final String title;
  final Widget trailing;
  final IconData iconData;
  final Color backgroundIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Material(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                IconItem(
                  iconSize: 18,
                  icon: iconData,
                  iconItemHeight: 45,
                  iconItemWidth: 45,
                  iconColor: context.colorScheme.surface,
                  backgroundIcon: backgroundIcon,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyle.body.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                trailing,
                const SizedBox(width: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
