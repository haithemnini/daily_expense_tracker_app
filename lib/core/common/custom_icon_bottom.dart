import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../extensions/extensions.dart';

class CustomIconBottom extends StatelessWidget {
  const CustomIconBottom({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surface,
      borderRadius: BorderRadius.circular(14),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => {},
        child: SizedBox(
          height: 40,
          width: 40,
          child: Center(
            child: FaIcon(
              icon,
              color: context.colorScheme.outline,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}
