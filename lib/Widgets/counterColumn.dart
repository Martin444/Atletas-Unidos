import 'package:atletasunidos/Controllers/Homecontroller.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:atletasunidos/model/count.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterColumn extends StatefulWidget {
  String title;
  int index;
  int counter = 0;
  CounterColumn({this.title, this.index});
  @override
  _CounterColumnState createState() => _CounterColumnState();
}

class _CounterColumnState extends State<CounterColumn> {

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
                      onTap: (){
                        widget.counter > 0 ?
                        setState(() {
                          widget.counter = widget.counter -1;
                        })
                        :
                        print('hola');
                      },
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
                      onTap: (){
                        setState(() {
                          widget.counter = widget.counter +1;
                          _.updateCounter(Counters(
                            id: widget.index,
                            value: widget.counter
                          ));
                        });
                      },
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
      }
    );
  }
}
