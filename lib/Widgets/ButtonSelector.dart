import 'package:flutter/material.dart';

class ButtonSelector extends StatelessWidget {
  IconData iconD;
  Color colorB;
  VoidCallback onCall;
  ButtonSelector({this.iconD, this.colorB, this.onCall});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCall,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: colorB,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Icon(iconD, color: Colors.white, size: 30),
        ),
      ),
    );
  }
}