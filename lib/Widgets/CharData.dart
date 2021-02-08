import 'package:atletasunidos/Controllers/Homecontroller.dart';
import 'package:atletasunidos/Widgets/ButtonIRB.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:atletasunidos/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartData extends StatefulWidget {
  String titleChar;
  String titleChar2;
  String titleChar3;
  Users user;

  int selecIRB = 1;
  int boton;

  ChartData({
    this.titleChar,
    this.titleChar2,
    this.titleChar3,
    @required this.user,
  });

  @override
  _ChartDataState createState() => _ChartDataState();
}

class _ChartDataState extends State<ChartData> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('tabulate')
            .where('userID', isEqualTo: widget.user.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            double _limitY = 0.0;
            List<FlSpot> spots = [];
            List<String> listSession = [];
            List<double> _listIRG = [];
            List<int> _countdoc = [];

            for (int count = 0; count <= snapshot.data.docs.length; count++) {
              _countdoc.add(count);
            }

            snapshot.data.docs.forEach((element) {
              _listIRG.add(element.data()['IRRG']);
              listSession.add(element.data()['sesionName']);
            });

            // Recibimos el numero mayor
            for (int x = 1; x < _listIRG.length; x++) {
              if (_listIRG[x] > _limitY) {
                _limitY = _listIRG[x];
              }
            }

            for (int f = 0; f < snapshot.data.docs.length; f++) {
              // print(_countdoc.length),
              // print(_listIRG.length),
              spots.add(FlSpot(_countdoc[f].toDouble(), _listIRG[f]));
            }

            return Container(
              width: Get.height / 1.3,
              padding: EdgeInsets.only(right: 20, left: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 15.0,
                        offset: Offset(0.0, 7.0))
                  ]),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Botones top

                        ButtonIRB(
                          title: widget.titleChar,
                          color:
                              widget.selecIRB == 1 ? redPrimary : blackPrimary,
                          onPres: () {
                            setState(() {
                              widget.selecIRB = 1;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ButtonIRB(
                          title: widget.titleChar2,
                          color:
                              widget.selecIRB == 2 ? redPrimary : blackPrimary,
                          onPres: () {
                            setState(() {
                              widget.selecIRB = 2;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ButtonIRB(
                          title: widget.titleChar3,
                          color:
                              widget.selecIRB == 3 ? redPrimary : blackPrimary,
                          onPres: () {
                            setState(() {
                              widget.selecIRB = 3;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: Get.height / 1.3,
                    padding: const EdgeInsets.only(
                      right: 15.0,
                      left: 30.0,
                    ),
                    child: LineChart(
                      sampleData1(
                          spots: spots,
                          listSession: listSession,
                          limitY: _limitY),
                      swapAnimationDuration: const Duration(milliseconds: 250),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(
              width: Get.height / 1.3,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

LineChartData sampleData1({
  @required List<FlSpot> spots,
  @required List<String> listSession,
  @required double limitY,
}) {
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
      drawVerticalLine: true,
    ),
    titlesData: FlTitlesData(
      bottomTitles: SideTitles(
        interval: 1,
        showTitles: true,
        reservedSize: -5,
        getTextStyles: (value) => const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        margin: 10,
        getTitles: (value) {
          var number = value.toInt();

          var compare = number % 2;

          print(listSession);

          // switch (compare) {
          //   case 0:
          //     break;
          //   default:
          // }
          return listSession[value.toInt()];

          // return 'h';
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
            case 5:
              return '5';
          }
          return '';
        },
        margin: 8,
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
    maxX: listSession.length.toDouble() - 1,
    maxY: limitY + 1,
    minY: 0,
    lineBarsData: linesBarData1(spots: spots),
  );
}

List<LineChartBarData> linesBarData1({
  @required List<FlSpot> spots,
}) {
  final LineChartBarData lineChartBarData1 = LineChartBarData(
    spots: spots,
    isCurved: true,
    colors: [
      const Color(0xff4af699),
    ],
    barWidth: 2,
    gradientFrom: Offset(0.2, 0.3),
    gradientTo: Offset(0.2, 0.3),
    colorStops: [
      2.9,
    ],
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: true,
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
