import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../blocs/themes_bloc/themes_cubit.dart';
import 'widgets.dart';

class DarkModeSwitch extends StatefulWidget {
  const DarkModeSwitch({super.key});

  @override
  State<DarkModeSwitch> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  late bool isSwitched;

  @override
  void initState() {
    isSwitched = context.read<ThemesCubit>().state.maybeMap(
          orElse: () => false,
          loadedThemeMode: (state) => state.themeMode == ThemeMode.dark,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ItemSettings(
      title: isSwitched ? 'Dark Mode' : 'Light Mode',
      iconData: isSwitched ? FontAwesomeIcons.moon : FontAwesomeIcons.solidSun,
      backgroundIcon: Colors.grey.shade800,
      trailing: BlocBuilder<ThemesCubit, ThemesState>(
        builder: (context, state) {
          return Switch(
            value: isSwitched,
            onChanged: (themeMode) {
              setState(() {
                isSwitched = themeMode;
                context.read<ThemesCubit>().toggleTheme();
              });
            },
          );
        },
      ),
    );
  }
}
