import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../extension/extension.dart';
import '../styles/app_text_style.dart';

class CustomItemButton extends StatelessWidget {
  const CustomItemButton({
    super.key,
    this.text,
    this.padding,
    this.leading,
    this.iconSize,
    this.trailing,
    this.onPressed,
    this.onLongPress,
    this.iconItemWidth,
    this.iconItemHeight,
    required this.icon,
    required this.iconColor,
    required this.backgroundItem,
    required this.backgroundIcon,
  });

  final String? text;
  final IconData icon;
  final Color iconColor;
  final Widget? leading;
  final Widget? trailing;
  final double? iconSize;
  final double? iconItemWidth;
  final double? iconItemHeight;
  final Color backgroundItem;
  final Color backgroundIcon;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Material(
        color: backgroundItem,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          onLongPress: onLongPress,
          child: Container(
            padding: padding ??
                const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconItem(
                  icon: icon,
                  iconColor: iconColor,
                  iconSize: iconSize ?? 18,
                  backgroundIcon: backgroundIcon,
                  iconItemHeight: iconItemHeight ?? 45,
                  iconItemWidth: iconItemWidth ?? 45,
                ),
                const SizedBox(width: 12.0),
                leading ??
                    Text(
                      text ?? '',
                      style: AppTextStyle.body.copyWith(
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                trailing != null ? const Spacer() : const SizedBox(),
                trailing ?? const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconItem extends StatelessWidget {
  const IconItem({
    super.key,
    required this.icon,
    required this.iconSize,
    required this.iconColor,
    required this.iconItemWidth,
    required this.backgroundIcon,
    required this.iconItemHeight,
  });

  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final Color backgroundIcon;
  final double iconItemWidth;
  final double iconItemHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: iconItemWidth,
      height: iconItemHeight,
      decoration: BoxDecoration(
        color: backgroundIcon,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: FaIcon(icon, size: iconSize, color: iconColor),
      ),
    );
  }
}
