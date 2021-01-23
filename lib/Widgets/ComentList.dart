import 'package:atletasunidos/Widgets/ComentItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComentList extends StatefulWidget {
  String publicID;

  ComentList({this.publicID});
  @override
  _ComentListState createState() => _ComentListState();
}

class _ComentListState extends State<ComentList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('publics').doc(widget.publicID).collection('coments').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if(snapshot.hasData){
            List<ComentItem> listComent = new List();

          snapshot.data.docs.forEach((element) {
              print(element['userName']);
              var name = element['userName'];
              var photo = element['userPhoto'];
              var conten = element['conten'];

              listComent.add(ComentItem(name: name,photo: photo, content: conten,));
          });

          return SingleChildScrollView(
            child:  Container(
              height: Get.height ,
              child: Column(
                children: listComent,
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }
}