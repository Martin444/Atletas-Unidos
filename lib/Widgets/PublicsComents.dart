import 'package:atletasunidos/Controllers/Homecontroller.dart';
import 'package:atletasunidos/Widgets/ComentList.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:atletasunidos/Widgets/text_input_location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PublicComents extends StatefulWidget {
  String publicID;

  PublicComents({this.publicID});
  @override
  _PublicComentsState createState() => _PublicComentsState();
}

class _PublicComentsState extends State<PublicComents> {
  var dataUser = Get.find<HomeControllers>();

  String conten ;

  TextEditingController coment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: blackPrimary,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
               children: [
                  // BarTop 
                InkWell(
                  onTapDown: (value){
                          print(value);
                        },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                       border: Border(
                          bottom: BorderSide(width: 0.5, color: Colors.white),
                        ),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          
                          onTap: (){
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back_rounded, color: Colors.white, size: 30,)
                        ),
                        SizedBox(width: 8,),
                        Text('Comentarios',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
               
                SingleChildScrollView(
                  child: Container(
                    height: Get.height - 100,
                    child: ComentList(publicID: widget.publicID))),
              
               
               ],
              )
            ),
          
            // Input del comentario
        
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: TextInputLocation(
                hintText: 'Escribe algo...', 
                onChang: (value){
                  setState(() {
                    conten = value;
                  });
                },
                iconData: InkWell(
                  onTap: (){
                    if(coment.value.text.length >= 1){
                        FirebaseFirestore.instance.collection('publics')
                          .doc(widget.publicID)
                          .collection('coments')
                          .add({
                            'userName' : dataUser.usere.name,
                            'userPhoto' : dataUser.usere.photoURL,
                            'conten' : coment.text
                          }).then((value) => {
                            coment.clear()
                          });

                    }
                  },
                  child: Icon(
                    Icons.send_rounded, 
                  color:  Colors.white 
                  )), 
                controller: coment,
                typeText: TextCapitalization.sentences,
                )
              ),
                  
              
           
          ],
        ),
      ),
      
    );
  }
}