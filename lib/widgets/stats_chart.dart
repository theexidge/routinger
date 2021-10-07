//Flutter Package
import 'package:flutter/material.dart';

//Third Party Imports
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

//Provider Imports
import '../provider/charts_stats.dart';

class StatsChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> titles =
        Provider.of<ChartStats>(context, listen: false).getDates();
    final List<double> tasksCompleted =
        Provider.of<ChartStats>(context, listen: false).tasksCompleted;
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 8,
        minY: 0,
        maxY: Provider.of<ChartStats>(context, listen: false)
                .getMaximumTasksDouble() +
            3,
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            getTitles: (val) {
              switch (val.toInt()) {
                case 1:
                  return titles[0];
                case 2:
                  return titles[1];
                case 3:
                  return titles[2];
                case 4:
                  return titles[3];
                case 5:
                  return titles[4];
                case 6:
                  return titles[5];
                case 7:
                  return titles[6];
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
              FlSpot(1, tasksCompleted[0]),
              FlSpot(2, tasksCompleted[1]),
              FlSpot(3, tasksCompleted[2]),
              FlSpot(4, tasksCompleted[3]),
              FlSpot(5, tasksCompleted[4]),
              FlSpot(6, tasksCompleted[5]),
              FlSpot(7, tasksCompleted[6]),
            ],
          )
        ],
      ),
    );
  }
}
