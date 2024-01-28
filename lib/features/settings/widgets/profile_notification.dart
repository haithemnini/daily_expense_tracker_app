import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets.dart';

class ProfileNotification extends StatelessWidget {
  const ProfileNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemSettings(
      title: 'Notification',
      iconData: FontAwesomeIcons.bell,
      backgroundIcon: Colors.orange,
      trailing: const FaIcon(FontAwesomeIcons.chevronRight, size: 16),
      onTap: () => {},
    );
  }
}
