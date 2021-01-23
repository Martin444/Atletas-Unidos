import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextInputLocation extends StatelessWidget {

  final String hintText;
  final TextEditingController controller;
  final Widget iconData;
  void Function(String) onChang;
  TextInputType tipoTeclado;
  TextCapitalization typeText;

  TextInputLocation({
    Key key,
    @required this.hintText,
    @required this.iconData,
    @required this.controller,
    this.tipoTeclado,
    this.typeText,
    this.onChang
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20.0, left: 20.0),
  
      child: TextField(
        keyboardType: tipoTeclado,
        onChanged: (value){
          print(value);
        },
        controller: controller,
        textCapitalization: typeText ?? TextCapitalization.characters,
        style: TextStyle(
            fontSize: 19.0,
            fontFamily: "Lato",
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),

        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.white70
            ),
            suffixIcon:  iconData,
            fillColor: Colors.grey[700],
            filled: true,
            border:  InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[700]),
                borderRadius: BorderRadius.all(Radius.circular(12.0))
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[700]),
                borderRadius: BorderRadius.all(Radius.circular(12.0))
            )



        ),
      ),

      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black12,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0)
            )
          ]
      ),
    );
  }
}