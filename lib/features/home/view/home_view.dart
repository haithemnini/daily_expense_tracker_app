import 'package:flutter/material.dart';

import '../../../core/extension/extension.dart';
import '../../../core/helper/helper.dart';
import 'main_view.dart';
import 'state_view.dart';
import 'widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // The current index of the bottom navigation bar.
  int _currentIndex = 0;
  // The pages to be displayed.
  final List<Widget> _pages = const [
    MainView(),
    StateView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: _buildAppBar(context),
      floatingActionButton: const AppFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTabTapped: (index) => setState(() => _currentIndex = index),
      ),
      body: _pages.elementAt(_currentIndex),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: Helper.overlayStyleAppBar(context),
      backgroundColor: context.colorScheme.background,
    );
  }
}
