import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Titles {
  static getTitleData() => const FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 30,
            interval: 1,

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

// Widget bottomTitleWidgets(double value, TitleMeta meta) {
//   const style = TextStyle(
//     fontWeight: FontWeight.w500,
//     fontSize: 16,
//   );
//   Widget text;
//   final List<String> monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
//
//   if (value.toInt() >= 0 && value.toInt() < monthNames.length) {
//     text = Text(monthNames[value.toInt()], style: style);
//   } else {
//     text = const Text('', style: style); // Default to empty string if value is out of range
//   }
//
//   return SideTitleWidget(
//     axisSide: meta.axisSide,
//     child: text,
//   );
// }

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;
  if (value == 20) {
    text = '20';
  }else if (value == 40) {
    text = '40';
  } else if (value == 60) {
    text = '60';
  } else if (value == 80) {
    text = '80';
  } else if (value == 100) {
    text = '100';
  } else if (value == 120) {
    text = '120';
  } else {
    text = ''; // No text for other values
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}

