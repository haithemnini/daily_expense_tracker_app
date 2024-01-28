import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets.dart';

class ProfileLogout extends StatelessWidget {
  const ProfileLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemSettings(
      title: 'Logout',
      iconData: FontAwesomeIcons.rightFromBracket,
      backgroundIcon: Colors.red,
      trailing: const FaIcon(FontAwesomeIcons.chevronRight, size: 16),
      onTap: () => {},
    );
  }
}
