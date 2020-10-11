import 'package:atletasunidos/Widgets/ButtonPrimary.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 70,
                width: 70,
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pinimg.com/originals/bc/d0/4c/bcd04c92515f8e433ef2cae0890a66f2.jpg'),
                ),
              ),
              SizedBox(width: 10,),
              Text('Ricardo Celis',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                  ),
            ],
          ),

          ButtonPrimary(
            width: 50,
            height: 30,
            text: 'ver', 
            onPressed:(){

          })
        ],
      ),
    );
  }
}