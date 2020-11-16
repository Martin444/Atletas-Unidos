import 'package:atletasunidos/Controllers/Homecontroller.dart';
import 'package:atletasunidos/Widgets/ButtonIRB.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartData extends StatefulWidget {

  String titleChar;
  String titleChar2;
  String titleChar3;

  int selecIRB = 1;
  int boton;

  ChartData({this.titleChar, this.titleChar2, this.titleChar3});

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

    List<String> sessions = List<String>();

    var compareID = Get.find<HomeControllers>();

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('tabulate').where('userID', isEqualTo: compareID.usere.uid).snapshots(),
      builder: (context, snapshot) {
        
        var resulter = snapshot.data;

        resulter.documents.forEach((f){

          sessions.add(f['sesionName']);

        });

        if(snapshot.hasData){

          return Container(
            width: Get.height / 1.3,
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
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Botones top
                      
                      ButtonIRB(
                        title:widget.titleChar,
                        color: widget.selecIRB == 1 ? redPrimary : blackPrimary,
                        onPres: (){
                          setState(() {
                            widget.selecIRB = 1;
                          });
                        },
                      ),
                      SizedBox(width: 10,),
                      ButtonIRB(
                        title:widget.titleChar2,
                        color: widget.selecIRB == 2 ? redPrimary : blackPrimary,
                        onPres: (){
                          setState(() {
                            widget.selecIRB = 2;
                          });
                        },
                      ),
                      SizedBox(width: 10,),
                      ButtonIRB(
                        title:widget.titleChar3,
                        color: widget.selecIRB == 3 ? redPrimary : blackPrimary,
                        onPres: (){
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
                    padding: const EdgeInsets.only(right: 15.0, left: 30.0,),
                    child: LineChart(
                      sampleData1(sessions),
                      swapAnimationDuration: const Duration(milliseconds: 250),
                    ),
                ),
              ],
            ),
          );
        
        } else {
          return Container(
            child: Center(
              child: Text('Hola no hay datos aun'),
            ),
          );
        }

      }
    );
  }
}
          
  LineChartData sampleData1(List<String> sessions) {

    print(sessions[1]);

       
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

            titlesData: 
              
              FlTitlesData(
                bottomTitles: SideTitles(
                  interval: 2,
                  showTitles: true,
                  reservedSize: -5,
                  getTextStyles: (value) => const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  margin:10,
                  
                    getTitles: (value){
                      var number = value.toInt();

                      var compare = number % 2;

                      switch (compare) {
                        case 0:
                          return sessions[value.toInt() ];
                          break;
                        default:
                      }
                          return 'h';    
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
            maxX: sessions.length.toDouble() ,
            maxY: 6,
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