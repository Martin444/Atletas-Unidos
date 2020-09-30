import 'package:flutter/material.dart';
import 'package:atletasunidos/model/orders.dart';




class Users {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final List<Order> myOrders;
  final int doctor;
  final String age;
  final String numeroDocumento;
  final String telefono;
  final String peso;
  final String tokenID;




  Users({
    Key key,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoURL,
    this.myOrders,
    this.doctor,
    this.age,
    this.numeroDocumento,
    this.telefono,
    this.peso,
    @required this.tokenID
   });
}