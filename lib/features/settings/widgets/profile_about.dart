import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets.dart';

class ProfileAbout extends StatelessWidget {
  const ProfileAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemSettings(
      title: 'About',
      iconData: FontAwesomeIcons.circleInfo,
      backgroundIcon: Colors.blue,
      trailing: const FaIcon(FontAwesomeIcons.chevronRight, size: 16),
      onTap: () => {},
    );
  }
}
