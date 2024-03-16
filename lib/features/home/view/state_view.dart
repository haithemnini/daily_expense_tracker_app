import 'package:flutter/material.dart';

import '../../../core/enum/enum.dart';
import '../../../core/shared/shared.dart';
import 'widgets/widgets.dart';

class StateView extends StatelessWidget {
  const StateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Scaffold(
        body: _buidBody(),
      ),
    );
  }

  Widget _buidBody() {
    return const SafeArea(
      bottom: false,
      child: Center(
        child: Column(
          children: [
            HeaderAppBarFilter(),
            SizedBox(height: 12),
            Expanded(
              child: CustomTabBar(
                tabControllerCount: 2,
                tabs: [
                  Tab(text: 'Income'),
                  Tab(text: 'Expense'),
                ],
                children: [
                  TransactionFilter(
                    category: Category.income,
                  ),
                  TransactionFilter(
                    category: Category.expense,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
