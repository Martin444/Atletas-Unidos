import 'package:atletasunidos/Widgets/const.dart';
import 'package:flutter/material.dart';


class CounterInput extends StatefulWidget {
  String title;
  int counter = 0;
  VoidCallback onRemuve;
  VoidCallback onAdded;

  CounterInput({
    this.title,
    this.counter,
    this.onRemuve,
    this.onAdded
  });
  @override
  _CounterInputState createState() => _CounterInputState();
}

class _CounterInputState extends State<CounterInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(widget.title,
              style: TextStyle(
                  fontSize: 19.0,
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

          Container(
            child: Row(
              children: [
                  //Remove button
                  GestureDetector(
                    onTap: widget.onRemuve,
                    child: Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: redPrimary,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Image.asset('assets/Minus.png'),
                      ),
                    ),
                  ),
                  //Counter text 
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      // color]: redPrimary,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text('${widget.counter}',
                        style: TextStyle(
                            fontSize: 19.0,
                            fontFamily: "Lato",
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  // Add button
                  GestureDetector(
                    onTap: widget.onAdded,
                    child: Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: redPrimary,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Image.asset('assets/Plus.png'),
                      ),
                    ),
                  ),
              ],

            ),
          )
        ],
      ),
      
    );
  }
}