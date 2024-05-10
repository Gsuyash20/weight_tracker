import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Titles {
  static getTitleData() => const FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false))
      );
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  Widget text;
  switch (value.toInt()) {
    case 2:
      text = const Text('MAR', style: style);
      break;
    case 5:
      text = const Text('JUN', style: style);
      break;
    case 8:
      text = const Text('SEP', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;
  switch (value.toInt()) {
    case 1:
      text = '40';
      break;
    case 3:
      text = '60';
      break;
    case 5:
      text = '80';
      break;
    case 7:
      text = '100';
      break;
    case 9:
      text = '120';
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}
