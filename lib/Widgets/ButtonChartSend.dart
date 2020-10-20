import 'package:atletasunidos/Views/CustomUser/DataPage.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonSendData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(DataPage(),
          transition: Transition.size,
          duration: Duration(milliseconds: 800),
        );
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: redPrimary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black45,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 7.0)
              )
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text('Ver ultimos resultados',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold
                  ),
              ),
            ),
            Container(
              child: Icon(Icons.show_chart, size: 35, color: Colors.white,)
            ),
          ],
        ),
      ),
    );
  }
}