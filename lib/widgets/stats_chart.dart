import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatsChart extends StatelessWidget {
  final double maxTasks;

  StatsChart({
    required this.maxTasks,
  });
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 8,
        minY: 0,
        maxY: maxTasks + 2,
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            getTitles: (val) {
              switch (val.toInt()) {
                case 1:
                  return '26/07';
                case 2:
                  return '27/07';
                case 3:
                  return '28/07';
                case 4:
                  return '29/07';
                case 5:
                  return '30/07';
                case 6:
                  return '1/08';
                case 7:
                  return '2/08';
              }
              return '';
            },
          ),
          rightTitles: SideTitles(),
          topTitles: SideTitles(),
        ),
        gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(strokeWidth: 1, color: Colors.lightBlue);
            },
            drawHorizontalLine: true,
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return FlLine(strokeWidth: 1, color: Colors.lightBlue);
            }),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(1, 4),
              FlSpot(2, 6),
              FlSpot(3, 8),
              FlSpot(4, 2),
              FlSpot(5, 10),
              FlSpot(6, 4),
              FlSpot(7, 1),
            ],
          )
        ],
      ),
    );
  }
}
