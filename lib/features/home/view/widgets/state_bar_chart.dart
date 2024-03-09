import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/styles/app_colors.dart';

class StateBarChart extends StatefulWidget {
  const StateBarChart({super.key, required this.chartData});

  final Map<DateTime, double> chartData;

  @override
  State<StateBarChart> createState() => _StateBarChartState();
}

class _StateBarChartState extends State<StateBarChart> {
  final Duration animDuration = const Duration(milliseconds: 300);
  int touchedIndex = -1;

  final Color barBackgroundColor = AppColors.outline.withAlpha(50);
  final Color touchedBarColor = AppColors.secondary;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: BarChart(
        mainBarData(),
        swapAnimationDuration: animDuration,
        swapAnimationCurve: Curves.easeInOutCubic,
      ),
    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: context.colorScheme.primary.withAlpha(200),
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              '',
              const TextStyle(),
              children: [
                TextSpan(
                  text:
                      '${widget.chartData.keys.elementAt(groupIndex).formattedDateOnly}\n',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: widget.chartData.values
                      .elementAt(groupIndex)
                      .toCurrencyWithSymbol(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
          tooltipMargin: 10,
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Text(
        widget.chartData.keys.elementAt(value.toInt()).formattedDateOnlyShort,
        style: TextStyle(
          color: context.colorScheme.onSurface,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  List<BarChartGroupData> showingGroups() {
    final maxValue = widget.chartData.values.reduce(
      (max, value) => value > max ? value : max,
    );

    return List.generate(widget.chartData.length, (i) {
      final value = widget.chartData.values.elementAt(i);
      return makeGroupData(i, value, maxValue, isTouched: i == touchedIndex);
    });
  }

  BarChartGroupData makeGroupData(
    int x,
    double y,
    double maxValue, {
    bool isTouched = false,
    Color? barColor,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 25 : y,
          color: isTouched ? touchedBarColor : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: touchedBarColor, width: 0)
              : const BorderSide(color: Colors.transparent, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: maxValue,
            color: barBackgroundColor,
          ),
          gradient: isTouched ? null : AppColors.primaryGradient,
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}
