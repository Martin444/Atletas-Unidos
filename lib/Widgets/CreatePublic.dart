import 'dart:io';

import 'package:atletasunidos/Controllers/Homecontroller.dart';
import 'package:atletasunidos/Widgets/ButtonPrimary.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:atletasunidos/Widgets/text_input.dart';
import 'package:atletasunidos/Widgets/text_input_location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


class CreatePublic extends StatefulWidget {
  String fotox;
  bool ima = false;
  @override
  _CreatePublicState createState() => _CreatePublicState();
}

class _CreatePublicState extends State<CreatePublic> {
  File filer;

  var userd = Get.find<HomeControllers>();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedHours = TimeOfDay.now();

  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();



  @override
  Widget build(BuildContext context) {
  void pickerImage () async {
    PickedFile imagePick = await ImagePicker().getImage(source: ImageSource.gallery);

    filer = File(imagePick.path);


    firebase_storage.FirebaseStorage.instance.ref().child('${userd.usere.uid}/${DateTime.now().toString()}.jpg').putFile(filer).then(( storageUploadTask) => {
        storageUploadTask.ref.getDownloadURL().then((value) => {

          setState(() {
            widget.fotox = value;
            widget.ima = true;
          })
          // FirebaseFirestore.instance.collection('events').add({
            
          // })
        })
    }); 

  }
    

    return Scaffold(
      backgroundColor: blackPrimary,
      appBar: AppBar(
        elevation: 0,
        title: Text('Publicar',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0,
              fontFamily: "Lato",
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.ima == false ?
              Center(
                child: ButtonPrimary(
                  text: 'Cargar imagen', 
                  onPressed: (){
                    pickerImage();
                  },
                  height: 40,
                ),
              )
              :
              Column(
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(widget.fotox, fit: BoxFit.cover,),
                  ),
                  SizedBox(height: 10,),
                  // TextInputLocation(hintText: 'Nombre del evento', iconData: Icon(Icons.title,color: Colors.white,), controller: titleController),
                  TextInput(hintText: 'Escribe algo...', inputType: TextInputType.multiline, controller: descriptionController, maxLines: 4),
                  SizedBox(height: 20,),

                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text('Fecha/Hora',
                  //       style: TextStyle(
                  //       fontSize: 18.0,
                  //       fontFamily: "Lato",
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.bold),
                  //     ),

                  //       InkWell(
                  //         child: Container(
                  //           alignment: Alignment.center,
                  //           width: 140,
                  //           height: 40,
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(10.0),
                  //               gradient: LinearGradient(
                  //                   colors: [
                  //                     Color(0xFF1cbb78),//arriba
                  //                     Color(0xFF1cbb78)//abajo
                  //                   ],
                  //                   begin: FractionalOffset(0.2, 0.0),
                  //                   end: FractionalOffset(1.0, 0.6),
                  //                   stops: [0.0, 0.6],
                  //                   tileMode: TileMode.clamp
                  //               )
                  //           ),
                  //           child: Text(
                  //             DateFormat('dd-MM-yyyy / HH:mm').format(selectedDate),
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 15,
                  //             ),
                  //           ),
                  //         ),
                  //         onTap: () async{
                  //           final selectedDate = await _selectedDateTime(context);
                  //           if(selectedDate == null) return;

                  //           final selectedTime = await _selectTime(context);
                  //           if(selectedTime == null) return;
                  //           setState(() {
                  //             this.selectedDate = DateTime(
                  //                 selectedDate.year,
                  //                 selectedDate.month,
                  //                 selectedDate.day,
                  //                 selectedTime.hour,
                  //                 selectedTime.minute
                  //             );
                  //             this.selectedHours = selectedTime;
                  //           });

                  //         },
                  //       ),
                   
                  //   ],
                  // ),
                  // SizedBox(height: 30,),
                
                  ButtonPrimary(
                    text: 'Publicar', 
                    onPressed: (){

                      if(descriptionController.text.length > 1){
                        FirebaseFirestore.instance.collection('publics').add({
                            'photoConten': widget.fotox,
                            'textconten': descriptionController.text,
                            'userID' : userd.usere.uid,
                            'userName' : userd.usere.name,
                            'userPhoto' : userd.usere.photoURL,
                            'likes' : []
                        }).then((value) => {
                          Get.back()
                        });
                      }
                    },
                    height: 40,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<TimeOfDay> _selectTime(BuildContext context){
    final now = DateTime.now();

    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
    );
  }

  Future<DateTime> _selectedDateTime(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(seconds: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
  );
}