import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/extensions/extensions.dart';
import 'main/main_view.dart';
import 'stat/stat_view.dart';
import 'widget/app_bottom_nav_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // The current index of the bottom navigation bar.
  int _currentIndex = 0;
  // The pages to be displayed.
  final List<Widget> _pages = const [MainView(), StatView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTabTapped: (int index) => setState(() => _currentIndex = index),
      ),
      floatingActionButton: _buildFAB(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: _pages.elementAt(_currentIndex),
      ),
    );
  }

  _buildFAB(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      // elevation: 0,
      onPressed: () {},
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              context.colorScheme.tertiary,
              context.colorScheme.secondary,
              context.colorScheme.primary,
            ],
            transform: const GradientRotation(pi / 4),
          ),
        ),
        child: const Icon(FontAwesomeIcons.plus),
      ),
    );
  }
}
