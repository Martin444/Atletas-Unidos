

import 'package:atletasunidos/Widgets/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeControllers extends GetxController{



  loading(){
    Get.dialog(
      Dialog(
        child: Container(
          height: 100,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(redPrimary),
                ),
                SizedBox(width: 30),
                Text('Cargando...',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 21
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}