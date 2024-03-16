import 'dart:math';

import 'package:flutter/material.dart';

import '../extension/extension.dart';

class CustomTabBar extends StatefulWidget {
  final int tabControllerCount;
  final List<Widget> tabs;
  final List<Widget> children;

  const CustomTabBar({
    Key? key,
    required this.tabControllerCount,
    required this.tabs,
    required this.children,
  }) : super(key: key);

  @override
  CustomTabBarState createState() => CustomTabBarState();
}

class CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.tabControllerCount,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: context.colorScheme.surface,
          ),
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: context.colorScheme.outline,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            indicator: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.colorScheme.primary,
                  context.colorScheme.secondary,
                  context.colorScheme.tertiary,
                ],
                transform: const GradientRotation(pi / 4),
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            tabs: widget.tabs,
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: widget.children,
          ),
        ),
      ],
    );
  }
}
