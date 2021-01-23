import 'package:atletasunidos/Controllers/Homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPizarra extends StatefulWidget {
  String name;
  double irg;
  String photoURL;

  UserPizarra({this.name, this.photoURL, this.irg});

  @override
  _UserPizarraState createState() => _UserPizarraState();
}

class _UserPizarraState extends State<UserPizarra> {

  var datIrg = Get.find<HomeControllers>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: datIrg.irGPizarra == widget.irg ? Colors.amber : Colors.black12,
        borderRadius: BorderRadius.circular(10)
        
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.photoURL),
                ),
              ),
              SizedBox(width: 5,),
              Text(widget.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),

          Text('${widget.irg}',
            style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
          )
        ],
      ),
    );
  }
}