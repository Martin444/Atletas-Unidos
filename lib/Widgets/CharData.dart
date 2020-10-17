import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartData extends StatefulWidget {

  String titleChar;

  ChartData({this.titleChar});

  @override
  _ChartDataState createState() => _ChartDataState();
}

class _ChartDataState extends State<ChartData> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 1.3,
      margin: EdgeInsets.only(right:20),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(20),
        boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black12,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0)
            )
          ]
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(widget.titleChar,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold
                ),
            ),
          ),
          Container(
            height: 240,
              padding: const EdgeInsets.only(right: 15.0, left: 30.0,),
              child: LineChart(
                sampleData1(),
                swapAnimationDuration: const Duration(milliseconds: 250),
              ),
          ),
        ],
      ),
    );
  }
}
          
  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),

      gridData: FlGridData(
        show: true,
      ),

      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 82,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          margin:20,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'CR93';
              case 3:
                return 'JIOA';
              case 5:
                return 'DEFG';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),

          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1Kg';
              case 2:
                return '2Kg';
              case 3:
                return '3Kg';
              case 4:
                return '4Kg';
            }
            return '';
          },
          margin:18,
          reservedSize: 7,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 2,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: 6,
      maxY: 5,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
}

List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        // FlSpot(3, 1.5),
        // FlSpot(5, 1.4),
        FlSpot(3, 2.4),
        // FlSpot(10, 2),
        FlSpot(5, 3.2),
        // FlSpot(13, 1.8),
      ],
      isCurved: true,
      colors: [
        const Color(0xff4af699),
      ],
      barWidth: 4,
      gradientFrom: Offset(0.2, 0.3),
      gradientTo: Offset(0.2, 0.3),
      colorStops:[
        2.9,
      ],
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );

    return [
      lineChartBarData1,
      // lineChartBarData2,
      // lineChartBarData3,
    ];
  }