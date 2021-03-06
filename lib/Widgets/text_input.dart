import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  int maxLines = 1;

  TextInput(
      {Key key,
      @required this.hintText,
      @required this.inputType,
      @required this.controller,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(right: 20.0, left: 20.0),
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black12, blurRadius: 25.0, offset: Offset(0.0, 7.0))
      ]),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        style: TextStyle(
            fontSize: 18.0,
            fontFamily: "Lato",
            color: Colors.white,
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[700],
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.white70
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[700]),
                borderRadius: BorderRadius.all(Radius.circular(9.0))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[700]),
                borderRadius: BorderRadius.all(Radius.circular(9.0)))),
      ),
    );
  }
}
