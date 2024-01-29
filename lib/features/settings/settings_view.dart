import 'package:flutter/material.dart';

import '../../core/shared/shared.dart';
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
    return const SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SettingsProfilePersonal(),
            SizedBox(height: 10),
            DarkModeSwitch(),
            SizedBox(height: 10),
            SettingsNotification(),
            SizedBox(height: 10),
            SettingsAbout(),
            SizedBox(height: 10),
            SettingsLogout(),
            SizedBox(height: 10),
            Spacer(),

            //App Version
            Text('App Version: 1.0.0'),
          ],
        ),
      ),
    );
  }
}
