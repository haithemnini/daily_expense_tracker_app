import 'package:flutter/material.dart';

import '../../core/extension/extension.dart';
import '../../core/helper/helper.dart';
import 'main/main_view.dart';
import 'stat/stat_view.dart';
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
  final List<Widget> _pages = const [MainView(), StatView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      floatingActionButton: const AppFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTabTapped: (int index) => _changePage(index),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: _pages.elementAt(_currentIndex),
      ),
    );
  }

  void _changePage(int index) => setState(() => _currentIndex = index);

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: Helper.overlayStyleAppBar(context),
      backgroundColor: context.colorScheme.background,
    );
  }
}
