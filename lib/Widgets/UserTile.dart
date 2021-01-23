import 'package:atletasunidos/Widgets/ButtonPrimary.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {

  String name;
  String photo;
  String uid;
  int admin;

  UserTile({this.uid, this.name, this.admin, this.photo});

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
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(photo),
                ),
              ),
              SizedBox(width: 10,),
              Text(name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                  ),
            ],
          ),

          Switch(
            value: admin == 1 ? true : false, 
            activeColor: pinkPrimary,
            onChanged: (value){

              if(admin ==1){
                FirebaseFirestore.instance.collection('users').doc(uid).set({
                  'doctor' : 3
                }, SetOptions(merge: true));
              } else {
                FirebaseFirestore.instance.collection('users').doc(uid).set({
                  'doctor' : 1
                }, SetOptions(merge: true));
              }

          })
        ],
      ),
    );
  }
}