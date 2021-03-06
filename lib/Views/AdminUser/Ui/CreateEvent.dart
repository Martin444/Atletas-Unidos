import 'dart:io';

import 'package:atletasunidos/Controllers/Homecontroller.dart';
import 'package:atletasunidos/Widgets/ButtonPrimary.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:atletasunidos/Widgets/counterKg.dart';
import 'package:atletasunidos/Widgets/text_input.dart';
import 'package:atletasunidos/Widgets/text_input_location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CreateEvent extends StatefulWidget {
  String fotox;
  bool ima = false;
  int conter = 1;
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  File filer;

  var userd = Get.find<HomeControllers>();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedHours = TimeOfDay.now();

  TextEditingController titleController = new TextEditingController();
  TextEditingController sesionController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    void pickerImage() async {
      PickedFile imagePick =
          await ImagePicker().getImage(source: ImageSource.gallery);

      filer = File(imagePick.path);

      firebase_storage.FirebaseStorage.instance
          .ref()
          .child('${userd.usere.uid}/${DateTime.now().toString()}.jpg')
          .putFile(filer)
          .then((storageUploadTask) => {
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
        title: Text(
          'Crear Evento',
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
              widget.ima == false
                  ? Center(
                      child: ButtonPrimary(
                        text: 'Cargar imagen',
                        onPressed: () {
                          pickerImage();
                        },
                        height: 40,
                      ),
                    )
                  : Column(
                      children: [
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(
                            widget.fotox,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextInputLocation(
                            hintText: 'Nombre del evento',
                            iconData: Icon(
                              Icons.title,
                              color: Colors.white,
                            ),
                            controller: titleController),
                        SizedBox(
                          height: 20,
                        ),
                        TextInputLocation(
                          hintText: 'Nombre de sesión',
                          iconData: Icon(
                            Icons.title,
                            color: Colors.white,
                          ),
                          controller: sesionController,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  'HITS',
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
                                      onTap: () {
                                        print(widget.conter);
                                        if (widget.conter > 1) {
                                          setState(() {
                                            widget.conter = widget.conter - 1;
                                          });
                                        }
                                      },
                                      onLongPress: () {},
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        decoration: BoxDecoration(
                                            color: redPrimary,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child:
                                              Image.asset('assets/Minus.png'),
                                        ),
                                      ),
                                    ),
                                    //Counter text
                                    Container(
                                      height: 40,
                                      width: 40,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      decoration: BoxDecoration(
                                        // color]: redPrimary,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${widget.conter}',
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
                                      onTap: () {
                                        setState(() {
                                          widget.conter = widget.conter + 1;
                                        });
                                      },
                                      onLongPress: () {},
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        decoration: BoxDecoration(
                                            color: redPrimary,
                                            borderRadius:
                                                BorderRadius.circular(10)),
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
                        ),
                        TextInput(
                            hintText: 'Indicaciones',
                            inputType: TextInputType.multiline,
                            controller: descriptionController,
                            maxLines: 4),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Fecha/Hora',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: "Lato",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                width: 140,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF1cbb78), //arriba
                                        Color(0xFF1cbb78) //abajo
                                      ],
                                      begin: FractionalOffset(0.2, 0.0),
                                      end: FractionalOffset(1.0, 0.6),
                                      stops: [0.0, 0.6],
                                      tileMode: TileMode.clamp),
                                ),
                                child: Text(
                                  DateFormat('dd-MM-yyyy / HH:mm')
                                      .format(selectedDate),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              onTap: () async {
                                final selectedDate =
                                    await _selectedDateTime(context);
                                if (selectedDate == null) return;

                                final selectedTime = await _selectTime(context);
                                if (selectedTime == null) return;
                                setState(() {
                                  this.selectedDate = DateTime(
                                      selectedDate.year,
                                      selectedDate.month,
                                      selectedDate.day,
                                      selectedTime.hour,
                                      selectedTime.minute);
                                  this.selectedHours = selectedTime;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ButtonPrimary(
                          text: 'Subir Evento',
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection('events')
                                .add({
                              'date': selectedDate,
                              'title': titleController.text,
                              'hits': widget.conter,
                              'sessionName': sesionController.text,
                              'photoUrl': widget.fotox,
                              'description': descriptionController.text,
                            }).then((value) => {Get.back()});
                          },
                          height: 40,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }

  Future<TimeOfDay> _selectTime(BuildContext context) {
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
