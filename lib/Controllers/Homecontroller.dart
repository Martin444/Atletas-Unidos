import 'dart:core';

import 'package:atletasunidos/Widgets/const.dart';
import 'package:atletasunidos/Widgets/counterColumn.dart';
import 'package:atletasunidos/model/count.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeControllers extends GetxController {
  int _count1 = 1;
  int _count2 = 1;
  int get count1 => _count1;

  int _counter = 0;

  // Mapas
  Map<int, dynamic> valorCount1 = new Map<int, dynamic>();
  Map<int, dynamic> valorCount2 = new Map<int, dynamic>();

  // Aqui pondremos los controllers que nos ayudara a calcular las tabulaciones
  TextEditingController _session = TextEditingController();
  TextEditingController get session => _session;
  int _minute = 0;
  int get minute => _minute;
  int _seconds = 0;
  int get seconds => _seconds;
  int _rounds = 0;
  int get rounds => _rounds;
  int _rep = 0;
  int get rep => _rep;
  int _kg = 0;
  int get kg => _kg;


  // Solucion temporal
  // Voy a crear una variable con su respectivo numero 

  

  List<Widget> getList1() {
    List<Widget> textField1 = [];
    for (int i = 0; i < _count1; i++) {
      textField1.add(
        Container(
          padding: EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CounterColumn(
                title: 'Repeticiones',
                index: i,
                
              ),
              CounterColumn(
                title: 'Kg',
                // counter: 0,
              )
            ],
          ),
        ),
      );
    }
    return textField1;
  }



  // Rounds incompletos
  List<Widget> getList2() {
    List<Widget> textField1 = [];
    for (int i = 0; i < _count2; i++) {
      textField1.add(
        Container(
          padding: EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CounterColumn(
                title: 'Repeticiones',
                // counter: 0,
              ),
              CounterColumn(
                title: 'Kg',
                // counter: 0,
              ),
            ],
          ),
        ),
      );
      valorCount2[_count2] =
          textField1; // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    }
    return textField1;
  }


  void updateCounter(Counters conters) {
    List<Counters> listact = List<Counters>();

    listact.add(conters);
    listact.forEach((element) { 
      print('Hay ${listact.length} siendo comparados');
      print('el indes ${element.id} es ${element.value}');
    });
  }

  // Funcion que agrega nuevas filas
  updateList1() {
    _count1 = _count1 + 1;
    update();
  }

  updateList2() {
    _count2 = _count2 + 1;
    update();
  }

  // Funcion que remueve en Minutos
  void onRemoveMinutes() {
    if (_minute <= 0) {
      print("No puede remover este numero");
    } else {
      _minute = _minute - 1;
      update();
    }
  }

  // Funcion que remueve en Segundos
  void onRemoveSeconds() {
    if (_seconds <= 0) {
      print("No puede remover este numero");
    } else {
      _seconds = _seconds - 1;
      update();
    }
  }

  // Funcion que remueve en Rounds
  void onRemoveRounds() {
    if (_rounds <= 0) {
      print("No puede remover este numero");
    } else {
      _rounds = _rounds - 1;
      update();
    }
  }

  // Funcion que agrega Minutos

  void onAddMinutes() {
    _minute = _minute + 1;
    update();
  }
  // Funcion que agrega Segundos

  void onAddSeconds() {
    _seconds = _seconds + 1;
    update();
  }
  // Funcion que agrega Segundos

  void onAddRounds() {
    _rounds = _rounds + 1;
    update();
  }

  loading() {
    Get.dialog(Dialog(
      child: Container(
        height: 100,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(redPrimary),
              ),
              SizedBox(width: 30),
              Text(
                'Cargando...',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 21),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
