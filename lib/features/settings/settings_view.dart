import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/extensions/extensions.dart';
import 'widgets/widgets.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: _buildBody(context),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: context.systemUiOverlayStyleAppBar(),
      leading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.chevronLeft, size: 18),
        onPressed: () => context.pop(),
      ),
      title: const Text(
        'Settings',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
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
            ProfilePersonal(),
            SizedBox(height: 10),
            DarkModeSwitch(),
            SizedBox(height: 10),
            ProfileNotification(),
            SizedBox(height: 10),
            ProfileAbout(),
            SizedBox(height: 10),
            ProfileLogout(),
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
