import 'package:flutter/material.dart';

class Turno {
  final String age;
  final String uid;
  final String dni;
  final String doctorID;
  final String doctorName;
  final String doctorPhoto;
  final String peso;
  final String razon;
  final String userName;
  final String userOwnerID;
  final String userPhoto;
  final String recomendacion;
  final String relativoDia;
  final DateTime horaDia;
  final bool turno;

  Turno({
    Key key,
    this.age,
    this.uid,
    this.dni,
    this.doctorID,
    this.doctorName,
    this.doctorPhoto,
    this.peso,
    this.razon,
    this.userName,
    this.userOwnerID,
    this.userPhoto,
    this.recomendacion,
    this.relativoDia,
    this.horaDia,
    this.turno
  });
}