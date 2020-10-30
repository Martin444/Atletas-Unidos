import 'package:flutter/material.dart';

import 'const.dart';

class ButtonIRB extends StatefulWidget {
  String title;
  Color color;
  VoidCallback onPres;

  ButtonIRB({this.title, this.onPres, this.color});

  @override
  _ButtonIRBState createState() => _ButtonIRBState();
}

class _ButtonIRBState extends State<ButtonIRB> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPres,
      child: Container(
        height: 30,
        width: 60,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.bold
              ),
          ),
        ),
      ),
    );
  }
}