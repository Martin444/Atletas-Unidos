import 'package:atletasunidos/Controllers/Homecontroller.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:atletasunidos/model/count.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterKg extends StatefulWidget {
  String title;
  int index;
  double counter = 0;
  VoidCallback onAdd;
  VoidCallback onRemove;
  CounterKg({this.title, this.index, this.counter, this.onAdd, this.onRemove});
  @override
  _CounterKgState createState() => _CounterKgState();
}

class _CounterKgState extends State<CounterKg> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllers>(
        init: HomeControllers(),
        builder: (_) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 19.0,
                        fontFamily: "Lato",
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      //Remove button
                      GestureDetector(
                        onTap: widget.onRemove,
                        onLongPress: widget.onRemove,
                        child: Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: redPrimary,
                              borderRadius: BorderRadius.circular(10)),
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
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            '${widget.counter}',
                            style: TextStyle(
                                fontSize: 19.0,
                                fontFamily: "Lato",
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      // Add button
                      GestureDetector(
                        onTap: widget.onAdd,
                        onLongPress: widget.onAdd,
                        child: Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: redPrimary,
                              borderRadius: BorderRadius.circular(10)),
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
        });
  }
}
