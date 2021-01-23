import 'package:atletasunidos/Views/CustomUser/AddResults.dart';
import 'package:atletasunidos/Widgets/ButtonPrimary.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerCard extends StatefulWidget {
  String title;
  String eventID;
  String description;
  String photoURL;
  DateTime fecha;

  BannerCard({this.photoURL, this.title, this.description, this.fecha, this.eventID});

  @override
  _BannerCardState createState() => _BannerCardState();
}

class _BannerCardState extends State<BannerCard> {

  String titleDate;


  @override
  Widget build(BuildContext context) {
  var formate = widget.fecha.difference(DateTime.now());

  if(formate.inHours <= -10){
      print('hola soy ${widget.title}');
      FirebaseFirestore.instance.collection('events').doc(widget.eventID).delete();
  }


  getDateFormat(){
    switch (formate.inDays >= 1) {
      case true:
          setState(() {
            titleDate= 'En ${formate.inDays} dias';
          });
          return titleDate;
        break;
      case false:
          setState(() {
            titleDate= 'En ${formate.inHours} horas';
          });
          return titleDate;
        break;
      default:
    }
  }

    return ClipRRect(
      
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: MediaQuery.of(context).size.width - 100,
        // he]ight: 40,
        height: 200,

        margin: EdgeInsets.only(top:20, right:10),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.photoURL),
              fit: BoxFit.cover,
            ),
        ),

        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
          color: Colors.black45,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(widget.description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w400
                ),
              ),
              formate.inHours > 1 ?
              Text(getDateFormat(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              )
              :
              ButtonPrimary(
                text: 'Subir datos',
                height: 40,
                onPressed: (){
                  Get.to(
                    AddResult(typeInde: 1)
                  );
              })
            ],
          ),
        )
      ),
    );
  }
}