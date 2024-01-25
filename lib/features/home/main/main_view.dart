import 'package:flutter/material.dart';

import '../../../core/common/common.dart';
import 'widget/widget.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Column(
          children: [
            HeaderApp(),
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
