import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/router/app_route.dart';
import '../../../../core/router/router.dart';
import '../../../../core/shared/shared.dart';
import 'widgets.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ProfileIcon(),
        BackButton(
          onPressed: () {},
        ),
        CustomIconBottom(
          icon: FontAwesomeIcons.gear,
          onPressed: () => context.pushNamed(RoutesName.settings),
        ),
      ],
    );
  }
}