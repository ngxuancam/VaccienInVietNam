import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class LineChartWidget extends StatelessWidget {
  LineChartWidget(this.listStatistic,this.listDate) {
    int i=0;
    listSpot = listStatistic.map((statistic){ i++; return FlSpot(i.toDouble(),double.parse(statistic.toString()));}).toList();
  }
  late List<FlSpot> listSpot;
  final List<DateTime> listDate;
  final List listStatistic;
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
          titlesData: LineTitles.getTitleData(listDate),
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
              spots: listSpot,
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
final DateFormat dateFormat = DateFormat("dd/MM");
class LineTitles {
  static getTitleData(List<DateTime> listDate) => FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,

          getTitles: (value) {
            return dateFormat.format(listDate[value.toInt()-1]);
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
