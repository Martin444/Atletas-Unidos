import 'package:atletasunidos/Widgets/ButtonChartSend.dart';
import 'package:atletasunidos/Widgets/CreatePublic.dart';
import 'package:atletasunidos/Widgets/Events/BannerList.dart';
import 'package:atletasunidos/Widgets/InfoProfile.dart';
import 'package:atletasunidos/Widgets/PublicList.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:atletasunidos/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


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
      floatingActionButton: FloatingActionButton(
        backgroundColor: redPrimary,
        child: Icon(Icons.list_alt),
        onPressed: (){
            Get.to(CreatePublic(),
              transition: Transition.rightToLeftWithFade
            );
        },
      ),
      appBar: AppBar(
        leading: Icon(Icons.sort),
        backgroundColor: blackPrimary,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Center(
                  child: ButtonSendData(),
                    // ChartData(titleChar: 'IRK',),
                    // ChartData(titleChar: 'IRR',),
                    // ChartData(titleChar: 'IRG',),
                ),
              ),
              SizedBox(height: 30,),
              Text('Eventos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25
                  ),
                ),
                BannerList(), 


              SizedBox(height: 20,),

              Text('Publicaciones',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25
                  ),
                ),

              SizedBox(height: 20,),

              PublicList(),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}