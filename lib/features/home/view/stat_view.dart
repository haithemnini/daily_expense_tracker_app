import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/extension/extension.dart';
import '../../../core/shared/shared.dart';
import '../../../core/styles/app_text_style.dart';
import 'widgets/widgets.dart';

class StatView extends StatelessWidget {
  const StatView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            _buidlAppHeader(),
            const SizedBox(height: 20),
            const Expanded(
              child: CustomTabBar(
                tabControllerCount: 2,
                tabs: [
                  Tab(text: 'Income'),
                  Tab(text: 'Expense'),
                ],
                children: [
                  IncomeTransaction(),
                  IncomeTransaction(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buidlAppHeader() {
    return Row(
      children: [
        Text(
          'Transaction',
          style: AppTextStyle.title.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        CustomIconBottom(
          onPressed: () {},
          icon: FontAwesomeIcons.filter,
        )
      ],
    );
  }
}

class IncomeTransaction extends StatelessWidget {
  const IncomeTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 5.0),
      child: Column(
        children: [
          Container(
            height: context.screenHeight(0.35),
            width: context.screenWidth(0.9),
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              children: [
                SizedBox(height: 10),
                Text('01 Jan 2021 - 31 April 2021'),
                SizedBox(height: 8.0),
                Text(
                  '\$3500.00',
                  style: AppTextStyle.title3,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _buidlHeaderText(context),
          const SizedBox(height: 5),
          // const TransactionList(),
        ],
      ),
    );
  }

  _buidlHeaderText(BuildContext context) {
    return Row(
      children: [
        Text(
          'Sat, 20 March 2022',
          style: AppTextStyle.caption.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Text(
          '-500.00',
          style: AppTextStyle.caption.copyWith(
            fontWeight: FontWeight.w600,
            color: context.colorScheme.error,
          ),
        ),
      ],
    );
  }
}
