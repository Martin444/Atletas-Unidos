import 'package:atletasunidos/Widgets/const.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartData extends StatefulWidget {

  String titleChar;
  String titleChar2;
  String titleChar3;

  ChartData({this.titleChar, this.titleChar2, this.titleChar3});

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
      padding: EdgeInsets.only(right:20, left: 20),
      alignment: Alignment.center,
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
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                    color: redPrimary,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(widget.titleChar,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold
                        ),
                    ),
                  ),
                ),
              
                SizedBox(width: 10,),
                Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                    color: redPrimary,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(widget.titleChar2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold
                        ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
              
                Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                    color: redPrimary,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(widget.titleChar3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold
                        ),
                    ),
                  ),
                ),
              
              ],
            ),
          ),
          Container(
              width: Get.height / 1.3,
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
          interval: 2,
          showTitles: true,
          reservedSize: 2,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          margin:10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'CF11';
              case 2:
                return 'JIOA';
              case 4:
                return 'DEFG';
              case 6:
                return 'DEFG';
              case 8:
                return 'DEFG';
              case 10:
                return 'DEFG';
              case 12:
                return 'DEFG';
              case 14:
                return 'DEFG';
              case 16:
                return 'DEFG';
            }
            return '2';
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
                return '1';
              case 2:
                return '2';
              case 3:
                return '3';
              case 4:
                return '4';
            }
            return '';
          },
          margin:8,
          reservedSize: 0,
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
      maxX: 16,
      maxY: 5,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
}

List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(0, 1),
        FlSpot(2, 1.5),
        FlSpot(4, 1.4),
        FlSpot(6, 2.4),
        FlSpot(8, 2),
        FlSpot(10, 3.2),
        FlSpot(12, 1.8),
        FlSpot(14, 1.8),
        FlSpot(16, 1.8),
      ],
      isCurved: true,
      colors: [
        const Color(0xff4af699),
      ],
      barWidth: 2,
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