import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets.dart';

class DarkModeSwitch extends StatefulWidget {
  const DarkModeSwitch({super.key});

  @override
  State<DarkModeSwitch> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return ItemSettings(
      title: isSwitched ? 'Dark Mode' : 'Light Mode',
      iconData: isSwitched ? FontAwesomeIcons.moon : FontAwesomeIcons.solidSun,
      backgroundIcon: Colors.grey.shade800,
      trailing: Switch(
        value: isSwitched,
        onChanged: (value) => setState(() => isSwitched = value),
      ),
    );
  }
}
