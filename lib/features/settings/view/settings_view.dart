import '../../../core/utils/alerts/alerts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/shared/shared.dart';
import 'widgets/widgets.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Settings'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AuthProfile(),
            const SizedBox(height: 10),
            const DarkModeSwitch(),
            const SizedBox(height: 10),
            ItemSettings(
              title: 'Version',
              iconData: FontAwesomeIcons.circleInfo,
              backgroundIcon: Colors.blueAccent,
              trailing: const FaIcon(FontAwesomeIcons.chevronRight, size: 16),
              onTap: () => Alerts.showSheet(
                context: context,
                child: const VersionSheet(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
