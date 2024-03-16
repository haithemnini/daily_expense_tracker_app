import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/shared/shared.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/alerts/alerts.dart';
import '../../../blocs/state_bloc/state_cubit.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({super.key});

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  late DateTime startDate;
  late DateTime endDate;

  @override
  void initState() {
    super.initState();
    startDate = context.read<StateCubit>().startDate;
    endDate = context.read<StateCubit>().endDate;
  }

  @override
  Widget build(BuildContext context) {
    const iconSize = 16.0;
    const iconItemHeight = 35.0;
    const iconItemWidth = 35.0;
    const padding = EdgeInsets.symmetric(horizontal: 12, vertical: 15);
    final backgroundItem = context.colorScheme.surface;

    return Column(
      children: [
        _buidlHeaderText('Start Date'),
        const SizedBox(height: 10),
        CustomItemButton(
          text: startDate.formattedDateOnly,
          padding: padding,
          iconSize: iconSize,
          iconColor: Colors.white,
          iconItemWidth: iconItemWidth,
          iconItemHeight: iconItemHeight,
          backgroundIcon: context.colorScheme.outline,
          backgroundItem: backgroundItem,
          icon: FontAwesomeIcons.wallet,
          onPressed: () => _showPickeDate(context, startDate, true),
        ),
        const SizedBox(height: 15),
        _buidlHeaderText('End Date'),
        const SizedBox(height: 10),
        CustomItemButton(
          text: endDate.formattedDateOnly,
          padding: padding,
          iconSize: iconSize,
          iconColor: Colors.white,
          iconItemWidth: iconItemWidth,
          iconItemHeight: iconItemHeight,
          backgroundIcon: context.colorScheme.outline,
          backgroundItem: backgroundItem,
          icon: FontAwesomeIcons.wallet,
          onPressed: () => _showPickeDate(context, endDate, false),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buidlHeaderText(String title) {
    return Row(children: [
      const SizedBox(width: 8),
      Text(title, style: AppTextStyle.body)
    ]);
  }

  Future<DateTime?> _showPickeDate(
    BuildContext context,
    DateTime initialDate,
    bool isStartDate,
  ) {
    return Alerts.showPickeTransactionDate(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
      initialDate: initialDate,
      onDateSelected: (newDate) {
        if (isStartDate) {
          context.read<StateCubit>().newStartDate = newDate;
          setState(() => startDate = newDate);
        } else {
          context.read<StateCubit>().newEndDate = newDate;
          setState(() => endDate = newDate);
        }
      },
    );
  }
}
