import 'package:atletasunidos/Views/CustomUser/AddResults.dart';
import 'package:atletasunidos/Views/CustomUser/ListFellow.dart';
import 'package:atletasunidos/Widgets/ButtonPrimary.dart';
import 'package:atletasunidos/Widgets/CharData.dart';
import 'package:atletasunidos/Widgets/InfoProfile.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:atletasunidos/model/user.dart';
import 'package:flutter/material.dart';
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
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30,),
              InfoProfile(
                imagePath: widget.user.photoURL,
                nameU: widget.user.name,  
              ),
              SizedBox(height: 30,),
              Text('Tus ultimos avances',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold
                  ),
              ),
              SizedBox(height: 20,),

              ChartData(),

              SizedBox(height: 10,),

              ButtonPrimary(
                height: 40,
                text: 'Agregar resultados', 
                onPressed: (){
                    Get.to(AddResult(),
                      transition: Transition.cupertino
                    );
              }),
              
              SizedBox(height: 30,),
              
              Text('Compara el avance de tu grupo',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold
                  ),
              ),
              SizedBox(height: 20,),
              ListFellow()
            ],
          ),
        ),
      ),
    );
  }
}