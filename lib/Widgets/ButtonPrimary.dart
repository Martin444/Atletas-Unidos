import 'package:atletasunidos/Widgets/const.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatefulWidget {
  final String text ;
  double width = 0.0;
  double height = 0.0;
  final VoidCallback onPressed;

  ButtonPrimary({Key key, @required this.text, @required this.onPressed, this.height, this.width});

  @override
  _ButtonPrimaryState createState() => _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<ButtonPrimary> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
                colors:[
                  redPrimary,//arriba
                  redPrimary//abajo
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 14.6),
                stops: [0.0, 0.3],
                tileMode: TileMode.clamp
            )
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Lato",
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
