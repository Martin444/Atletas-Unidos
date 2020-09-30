import 'package:flutter/material.dart';

class Consulta{
  final String age;
  final String uid;
  final String dni;
  final String doctorID;
  final String doctorName;
  final String doctorPhoto;
  final String peso;
  final String consulta;
  final String respuesta;
  final String userName;
  final String userOwnerID;
  final String userPhoto;
  final String recomendacion;
  final String relativoDia;
  final DateTime horaDia;
  final bool respondido;

Consulta({
    Key key,
    this.age,
    this.uid,
    this.dni,
    this.doctorID,
    this.doctorName,
    this.doctorPhoto,
    this.peso,
    this.consulta,
    this.respuesta,
    this.userName,
    this.userOwnerID,
    this.userPhoto,
    this.recomendacion,
    this.relativoDia,
    this.horaDia,
    this.respondido
  });
}