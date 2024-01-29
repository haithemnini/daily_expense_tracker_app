import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/common/common.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/routing/routing.dart';
import 'widget.dart';

class HeaderApp extends StatelessWidget {
  const HeaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ProfileIcon(),
        CustomIconBottom(
          icon: FontAwesomeIcons.gear,
          onPressed: () => context.pushNamed(RoutesName.settings),
        ),
      ],
    );
  }
}
