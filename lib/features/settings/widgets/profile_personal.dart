import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/extensions/extensions.dart';

class ProfilePersonal extends StatelessWidget {
  const ProfilePersonal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => {},
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                // borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    context.colorScheme.primary,
                    context.colorScheme.secondary,
                    context.colorScheme.tertiary,
                  ],
                  transform: const GradientRotation(pi / 4),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile.png'),
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
                const Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Edit Personal Info',
                  style: TextStyle(
                    fontSize: 12,
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
