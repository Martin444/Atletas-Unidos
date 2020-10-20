import 'package:atletasunidos/Widgets/ButtonChartSend.dart';
import 'package:atletasunidos/Widgets/InfoProfile.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:atletasunidos/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomePage extends StatefulWidget {
  Users user; 
  HomePage({this.user});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackPrimary,
      appBar: AppBar(
        leading: Icon(Icons.sort),
        backgroundColor: blackPrimary,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InfoProfile(
                imagePath: widget.user.photoURL,
                nameU: widget.user.name,  
              ),
              SizedBox(height: 30,),

              Container(
                child: Center(
                  child: ButtonSendData(),
                    // ChartData(titleChar: 'IRK',),
                    // ChartData(titleChar: 'IRR',),
                    // ChartData(titleChar: 'IRG',),
                ),
              ),

              SizedBox(height: 20,),

              Container(
                height: 200,
                child: SvgPicture.asset('assets/analitcs.svg'))

              // ButtonPrimary(
              //   height: 40,
              //   text: 'Agregar resultados', 
              //   onPressed: (){
              //       Get.to(AddResult(),
              //         transition: Transition.downToUp,
              //         curve: Interval(0.65, 1.0),
              //         duration: Duration(milliseconds: 900)
              //       );
              // }),
              
              // SizedBox(height: 30,),
              
              // Text('Compara el avance de tu grupo',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 21,
              //       fontWeight: FontWeight.bold
              //     ),
              // ),
              // SizedBox(height: 20,),
              // ListFellow()
            ],
          ),
        ),
      ),
    );
  }
}