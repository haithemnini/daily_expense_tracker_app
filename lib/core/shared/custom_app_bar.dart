import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../extension/extension.dart';
import '../helper/helper.dart';
import '../router/router.dart';
import '../styles/app_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title, this.onPressed});

  final String? title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: context.colorScheme.background,
      systemOverlayStyle: Helper.overlayStyleAppBar(context),
      leading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.chevronLeft, size: 18),
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          } else {
            context.pop();
          }
        },
      ),
      title: Text(title ?? '', style: AppTextStyle.title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
