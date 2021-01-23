import 'package:atletasunidos/Widgets/const.dart';
import 'package:flutter/material.dart';

class ButtonBlue extends StatefulWidget {
  String title;
  VoidCallback onTap;

  ButtonBlue({this.title, this.onTap});

  @override
  _ButtonBlueState createState() => _ButtonBlueState();
}

class _ButtonBlueState extends State<ButtonBlue> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: blueTwo,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Text(widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
          ),
        ),
      ),
    );
  }
}