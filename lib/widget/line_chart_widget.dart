import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartWidget extends StatelessWidget {
  final List<Color> gradientColos = [
    Color.fromRGBO(120, 40, 103, 1),
    Color.fromRGBO(91, 43, 119, 1),
    Color.fromRGBO(46, 48, 145, 1),
    Color.fromRGBO(39, 51, 147, 1)
  ];

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          minX: 1,
          maxX: 10,
          minY: 0,
          maxY: 2200000,
          titlesData: LineTitles.getTitleData(),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color.fromRGBO(0, 0, 0, 0.5),
                strokeWidth: 1,
              );
            },
            drawVerticalLine: true,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(1, 1863172),
                FlSpot(2, 1359162),
                FlSpot(3, 1094141),
                FlSpot(4, 1874137),
                FlSpot(5, 1807233),
                FlSpot(6, 1358852),
                FlSpot(7, 1717649),
                FlSpot(8, 988531),
                FlSpot(9, 506333),
                FlSpot(10, 474818),
              ],
              isCurved: false,
              colors: gradientColos,
              barWidth: 3,
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColos
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              ),
            ),
          ],
          lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Color.fromRGBO(255, 255, 255, 0.5),
          )),
        ),
      );
}

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,

          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '27/11';
              case 2:
                return '28/11';
              case 3:
                return '29/11';
              case 4:
                return '30/11';
              case 5:
                return '31/11';
              case 6:
                return '1/12';
              case 7:
                return '2/12';
              case 8:
                return '3/12';
              case 9:
                return '4/12';
              case 10:
                return '5/12';
              default:
                return '';
            }
          },
          margin: 18,
          // getTextStyles: (value) => const TextStyles(
          //   color: Colors.amber,
          //   fontWeight: FontWeight.bold,
          //   fontSize: 16,
          // ),
          reservedSize: 10,
        ),
      );
}
