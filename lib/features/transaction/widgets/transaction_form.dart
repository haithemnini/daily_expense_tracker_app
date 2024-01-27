import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/common/categorys_list.dart';
import '../../../core/common/common.dart';
import '../../../core/extensions/extensions.dart';
import '../../../core/helpers/show_modal_sheet_helpers.dart';
import 'widgets.dart';

class TransactionForm extends StatelessWidget {
  const TransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    /// The size of the icons used in the transaction form.
    const iconSize = 16.0;

    /// The height of each icon item in the transaction form.
    const iconItemHeight = 35.0;

    /// The width of each icon item in the transaction form.
    const iconItemWidth = 35.0;

    /// The padding applied to the transaction form.
    const padding = EdgeInsets.symmetric(horizontal: 12, vertical: 15);

    /// The color of the icons in the transaction form, based on the current theme.
    final iconColor = Theme.of(context).colorScheme.surface;

    /// The background color of each item in the transaction form, based on the current theme.
    final backgroundItem = Theme.of(context).colorScheme.surface;

    /// The background color of the icons in the transaction form, based on the current theme.
    final backgroundIcon = Theme.of(context).colorScheme.outline;

    return Column(
      children: [
        _buildMoneyTextFeild(context),
        const SizedBox(height: 20),
        Column(
          children: [
            ItemButton(
              text: 'Food',
              padding: padding,
              iconSize: iconSize,
              iconColor: Colors.white,
              iconItemWidth: iconItemWidth,
              iconItemHeight: iconItemHeight,
              backgroundIcon: Colors.redAccent,
              backgroundItem: backgroundItem,
              icon: FontAwesomeIcons.burger,
              onPressed: () => _showModalSheet(context),
            ),
            ItemButton(
              padding: padding,
              iconSize: iconSize,
              iconColor: iconColor,
              iconItemWidth: iconItemWidth,
              iconItemHeight: iconItemHeight,
              backgroundIcon: backgroundIcon,
              backgroundItem: backgroundItem,
              icon: FontAwesomeIcons.noteSticky,
              leading: _buildItemTextFeild(context, text: 'Note'),
              // onPressed: () {},
            ),
            ItemButton(
              text: 'Today',
              padding: padding,
              iconSize: iconSize,
              iconColor: iconColor,
              iconItemWidth: iconItemWidth,
              iconItemHeight: iconItemHeight,
              backgroundIcon: backgroundIcon,
              backgroundItem: backgroundItem,
              icon: FontAwesomeIcons.calendarDay,
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }

  _buildMoneyTextFeild(BuildContext context) {
    return Container(
      height: 90,
      width: context.screenWidth(0.65),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: context.colorScheme.surface,
      ),
      child: const Center(
        child: CustomTextField(
          hintText: '\$',
          fontSize: 38,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w800,
          keyboardType: TextInputType.number,
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
        ),
      ),
    );
  }

  _buildItemTextFeild(BuildContext context, {required String text}) {
    return Flexible(
      child: CustomTextField(
        hintText: text,
        fontSize: 16,
        textAlign: TextAlign.start,
        fontWeight: FontWeight.w400,
        keyboardType: TextInputType.text,
      ),
    );
  }

  void _showModalSheet(BuildContext context) {
    showModalSheetHelpers(
      context: context,
      heigh: context.screenHeight(0.45),
      child: Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: const CategorysList(),
        ),
      ),
    );
  }
}
