import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartExample extends StatefulWidget {
  const BarChartExample({Key? key}) : super(key: key);

  @override
  State<BarChartExample> createState() => _BarChartExampleState();
}

class _BarChartExampleState extends State<BarChartExample> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 15,
          barGroups: barChartGroupData,
          titlesData: FlTitlesData(
            leftTitles: SideTitles(
              showTitles: true,
              interval: 5,
            ),
            bottomTitles: SideTitles(
              showTitles: true,
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          groupsSpace: 30,
          gridData: FlGridData(
            show: true,
            checkToShowHorizontalLine: (value) => value % 2 == 0,
            getDrawingHorizontalLine: (value) => FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            ),
          ),
        ),
      ),
    );
  }
}

List<BarChartGroupData> barChartGroupData = [
  BarChartGroupData(x: 1, barRods: [
    BarChartRodData(
      y: 10,
      colors: [Color(0xff43dde6), Color(0xff43dde6)],
      width: 20,
    ),
  ]),
  BarChartGroupData(x: 2, barRods: [
    BarChartRodData(
      y: 8.5,
      colors: [Color(0xff43dde6), Color(0xff43dde6)],
      width: 20,
    ),
  ]),
  BarChartGroupData(x: 3, barRods: [
    BarChartRodData(
      y: 12.6,
      colors: [Color(0xff43dde6), Color(0xff43dde6)],
      width: 20,
    ),
  ]),
  BarChartGroupData(x: 4, barRods: [
    BarChartRodData(
      y: 11.4,
      colors: [Color(0xff43dde6), Color(0xff43dde6)],
      width: 20,
    ),
  ]),
  BarChartGroupData(x: 5, barRods: [
    BarChartRodData(
      y: 7.5,
      colors: [Color(0xff43dde6), Color(0xff43dde6)],
      width: 20,
    ),
  ]),
  BarChartGroupData(x: 6, barRods: [
    BarChartRodData(
      y: 14,
      colors: [Color(0xff43dde6), Color(0xff43dde6)],
      width: 20,
    ),
  ]),
  BarChartGroupData(x: 7, barRods: [
    BarChartRodData(
      y: 12.2,
      colors: [Color(0xff43dde6), Color(0xff43dde6)],
      width: 20,
    ),
  ]),
];
