import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_style.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenHeight(3),
      height: context.screenHeight(0.25),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(2, 2),
            ),
          ],
          gradient: AppColors.primaryGradient),
      // color: Colors.blueAccent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Total Expense',
              style: AppTextStyle.caption.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '\$ 4800.00',
              style: AppTextStyle.title2.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildExpenseItem(
                  'Income',
                  '4800.00',
                ),
                _buildExpenseItem(
                  'Expense',
                  '4800.00',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildExpenseItem(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.13),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: title == 'Income'
                  ? const FaIcon(
                      FontAwesomeIcons.arrowDown,
                      color: Colors.greenAccent,
                      size: 12,
                    )
                  : const FaIcon(
                      FontAwesomeIcons.arrowUp,
                      color: Colors.redAccent,
                      size: 12,
                    ),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.caption.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                amount,
                style: AppTextStyle.body.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
