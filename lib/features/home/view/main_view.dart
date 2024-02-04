import 'package:flutter/material.dart';

import '../../../core/shared/shared.dart';
import 'widgets/widgets.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Column(
          children: [
            HeaderAppBar(),
            SizedBox(height: 20),
            ExpenseCard(),
            HeaderTransaction(),
            TransactionList(),
          ],
        ),
      ),
    );
  }
}
