import 'dart:core';

import 'package:atletasunidos/Views/CustomUser/AddHitBResult.dart';
import 'package:atletasunidos/Views/CustomUser/AddResults.dart';
import 'package:atletasunidos/Widgets/ButtonPrimary.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:atletasunidos/Widgets/counterColumn.dart';
import 'package:atletasunidos/model/count.dart';
import 'package:atletasunidos/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeControllers extends GetxController {
  Users _usere;
  Users get usere => _usere;

  List<dynamic> hitses = [];

  int _count1 = 1;
  int _count2 = 1;
  int _countnum = 0;
  double _limitY = 0.0;
  double get limity => _limitY;
  List<int> _countdoc = [];
  List<double> _listIRG = [];
  List<String> _listSession = [];
  List<String> get listSession => _listSession;
  List<FlSpot> _spots = List<FlSpot>();
  List<FlSpot> get spots => _spots;
  int get count1 => _count1;
  int get countnum => _countnum;
  int get count2 => _count2;

  double _irGPizarraMax = 0.0;
  double get irGPizarra => _irGPizarraMax;

  void getNumbermore(listed) {
    for (int x = 0; x < listed.length; x++) {
      if (listed[x] > _irGPizarraMax) {
        _irGPizarraMax = listed[x];
        update();
      }
    }
  }

  void updateUsere(Users use) {
    _usere = use;

    update();
  }

  void getDataGraphi(Users use) {
    FirebaseFirestore.instance
        .collection('tabulate')
        .where('userID', isEqualTo: use.uid)
        .get()
        .then((value) => {
              // Primero recibimos la cantidad de sesiones y lo multiplicamos por 2

              _countnum = value.docs.length * 2,
              for (int count = 0; count <= value.docs.length * 2; count++)
                {
                  if (count % 2 == 0)
                    {
                      _countdoc.add(count),
                      update(),
                    },
                },

              value.docs.forEach((element) {
                _listIRG.add(element.data()['IRGG']);
                _listSession.add(element.data()['sesionName']);
                update();
                // print(spots);
              }),
              // Recibimos el numero mayor
              for (int x = 1; x < _listIRG.length; x++)
                {
                  if (_listIRG[x] > _limitY) {_limitY = _listIRG[x], update()}
                },

              for (int f = 0; f < value.docs.length; f++)
                {
                  // print(_countdoc.length),
                  // print(_listIRG.length),
                  _spots.add(FlSpot(_countdoc[f].toDouble(), _listIRG[f])),
                  update()
                },
            });
  }

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

  // Estos datos usaremos para tabular los indices generales
  double _irkOne = 0.0;
  double get irkOne => _irkOne;
  double _irrOne = 0.0;
  double get irrOne => _irrOne;
  double _irgOne = 0.0;
  double get irgOne => _irgOne;

  // Solucion temporal
  // Voy a crear una variable con su respectivo numero
  // V_ariables para los contadores de los ejercicios primarios
  int _counter1 = 0;
  int get counter1 => _counter1;
  int _counter2 = 0;
  int get counter2 => _counter2;
  int _counter3 = 0;
  int get counter3 => _counter3;
  int _counter4 = 0;
  int get counter4 => _counter4;
  int _counter5 = 0;
  int get counter5 => _counter5;
  int _counter6 = 0;
  int get counter6 => _counter6;
  int _counter7 = 0;
  int get counter7 => _counter7;
  int _counter8 = 0;
  int get counter8 => _counter8;
  int _counter9 = 0;
  int get counter9 => _counter9;
  int _counter10 = 0;
  int get counter10 => _counter10;
  int _counter12 = 0;
  int get counter11 => _counter12;
  int _counter13 = 0;
  int get counter13 => _counter13;
  int _counter14 = 0;
  int get counter14 => _counter14;
  int _counter15 = 0;
  int get counter15 => _counter15;
  int _counter16 = 0;
  int get counter16 => _counter16;
  int _counter17 = 0;
  int get counter17 => _counter17;
  int _counter18 = 0;
  int get counter18 => _counter18;
  int _counter19 = 0;
  int get counter19 => _counter19;
  int _counter20 = 0;
  int get counter20 => _counter20;
  int _counter21 = 0;
  int get counter21 => _counter21;
  int _counter22 = 0;
  int get counter22 => _counter22;

  // V_ariables para los contadores de los ejercicios Incompletos
  int _incounter1 = 0;
  int get incounter1 => _incounter1;
  int _incounter2 = 0;
  int get incounter2 => _incounter2;
  int _incounter3 = 0;
  int get incounter3 => _incounter3;
  int _incounter4 = 0;
  int get incounter4 => _incounter4;
  int _incounter5 = 0;
  int get incounter5 => _incounter5;
  int _incounter6 = 0;
  int get incounter6 => _incounter6;
  int _incounter7 = 0;
  int get incounter7 => _incounter7;
  int _incounter8 = 0;
  int get incounter8 => _incounter8;
  int _incounter9 = 0;
  int get incounter9 => _incounter9;
  int _incounter10 = 0;
  int get incounter10 => _incounter10;
  int _incounter12 = 0;
  int get incounter11 => _incounter12;
  int _incounter13 = 0;
  int get incounter13 => _incounter13;
  int _incounter14 = 0;
  int get incounter14 => _incounter14;
  int _incounter15 = 0;
  int get incounter15 => _incounter15;
  int _incounter16 = 0;
  int get incounter16 => _incounter16;
  int _incounter17 = 0;
  int get incounter17 => _incounter17;
  int _incounter18 = 0;
  int get incounter18 => _incounter18;
  int _incounter19 = 0;
  int get incounter19 => _incounter19;
  int _incounter20 = 0;
  int get incounter20 => _incounter20;
  int _incounter21 = 0;
  int get incounter21 => _incounter21;
  int _incounter22 = 0;
  int get incounter22 => _incounter22;

  double _kg1 = 0;
  double get kg1 => _kg1;
  double _kg2 = 0;
  double get kg2 => _kg2;
  double _kg3 = 0;
  double get kg3 => _kg3;
  double _kg4 = 0;
  double get kg4 => _kg4;
  double _kg5 = 0;
  double get kg5 => _kg5;
  double _kg6 = 0;
  double get kg6 => _kg6;
  double _kg7 = 0;
  double get kg7 => _kg7;
  double _kg8 = 0;
  double get kg8 => _kg8;
  double _kg9 = 0;
  double get kg9 => _kg9;
  double _kg10 = 0;
  double get kg10 => _kg10;
  double _kg12 = 0;
  double get kg11 => _kg12;
  double _kg13 = 0;
  double get kg13 => _kg13;
  double _kg14 = 0;
  double get kg14 => _kg14;
  double _kg15 = 0;
  double get kg15 => _kg15;
  double _kg16 = 0;
  double get kg16 => _kg16;
  double _kg17 = 0;
  double get kg17 => _kg17;
  double _kg18 = 0;
  double get kg18 => _kg18;
  double _kg19 = 0;
  double get kg19 => _kg19;
  double _kg20 = 0;
  double get kg20 => _kg20;
  double _kg21 = 0;
  double get kg21 => _kg21;
  double _kg22 = 0;
  double get kg22 => _kg22;

  // Variables de kilogramos incompletos
  double _inkg1 = 0;
  double get inkg1 => _inkg1;
  double _inkg2 = 0;
  double get inkg2 => _inkg2;
  double _inkg3 = 0;
  double get inkg3 => _inkg3;
  double _inkg4 = 0;
  double get inkg4 => _inkg4;
  double _inkg5 = 0;
  double get inkg5 => _inkg5;
  double _inkg6 = 0;
  double get inkg6 => _inkg6;
  double _inkg7 = 0;
  double get inkg7 => _inkg7;
  double _inkg8 = 0;
  double get inkg8 => _inkg8;
  double _inkg9 = 0;
  double get inkg9 => _inkg9;
  double _inkg10 = 0;
  double get inkg10 => _inkg10;
  double _inkg12 = 0;
  double get inkg11 => _inkg12;
  double _inkg13 = 0;
  double get inkg13 => _inkg13;
  double _inkg14 = 0;
  double get inkg14 => _inkg14;
  double _inkg15 = 0;
  double get inkg15 => _inkg15;
  double _inkg16 = 0;
  double get inkg16 => _inkg16;
  double _inkg17 = 0;
  double get inkg17 => _inkg17;
  double _inkg18 = 0;
  double get inkg18 => _inkg18;
  double _inkg19 = 0;
  double get inkg19 => _inkg19;
  double _inkg20 = 0;
  double get inkg20 => _inkg20;
  double _inkg21 = 0;
  double get inkg21 => _inkg21;
  double _inkg22 = 0;
  double get inkg22 => _inkg22;

  // Add function to one
  void onAddCounter1() {
    _counter1 = _counter1 + 1;
    update();
    print(_counter1);
  }

  void onRemoveCounter1() {
    if (_counter1 > 0) {
      _counter1 = _counter1 - 1;
    }
    update();
    print(_counter1);
  }

  // Add function to one
  void onAddCounter2() {
    _counter2 = _counter2 + 1;
    update();
  }

  void onRemoveCounter2() {
    if (_counter2 > 0) {
      _counter2 = _counter2 - 1;
    }
    update();
  }

  // Add function to one
  void onAddCounter3() {
    _counter3 = _counter3 + 1;
    update();
  }

  void onRemoveCounter3() {
    if (_counter3 > 0) {
      _counter3 = _counter3 - 1;
    }
    update();
  }

  // Add function to one
  void onAddCounter4() {
    _counter4 = _counter4 + 1;
    update();
  }

  void onRemoveCounter4() {
    if (_counter4 > 0) {
      _counter4 = _counter4 - 1;
    }
    update();
  }

  // Add function to one
  void onAddCounter5() {
    _counter5 = _counter5 + 1;
    update();
  }

  void onRemoveCounter5() {
    if (_counter5 > 0) {
      _counter5 = _counter5 - 1;
    }
    update();
  }

  // Add function to one
  void onAddCounter6() {
    _counter6 = _counter6 + 1;
    update();
  }

  void onRemoveCounter6() {
    if (_counter6 > 0) {
      _counter6 = _counter6 - 1;
    }
    update();
  }

  // Add function to one
  void onAddCounter7() {
    _counter7 = _counter7 + 1;
    update();
  }

  void onRemoveCounter7() {
    if (_counter7 > 0) {
      _counter7 = _counter7 - 1;
    }
    update();
  }

  // Add function to one
  void onAddCounter8() {
    _counter8 = _counter8 + 1;
    update();
  }

  void onRemoveCounter8() {
    if (_counter8 > 0) {
      _counter8 = _counter8 - 1;
    }
    update();
  }

  // Add function to one
  void onAddCounter9() {
    _counter9 = _counter9 + 1;
    update();
  }

  void onRemoveCounter9() {
    if (_counter9 > 0) {
      _counter9 = _counter9 - 1;
    }
    update();
  }

  // Add function to one
  void onAddCounter10() {
    _counter10 = _counter10 + 1;
    update();
  }

  void onRemoveCounter10() {
    if (_counter10 > 0) {
      _counter10 = _counter10 - 1;
    }
    update();
  }

  // Add function to one
  void onAddkg1() {
    _kg1 = _kg1 + 0.5;
    update();
    print(_counter1);
  }

  void onRemovekg1() {
    if (_kg1 > 0) {
      _kg1 = _kg1 - 0.5;
    }
    update();
    print(_counter1);
  }

  // Add function to one
  void onAddkg2() {
    _kg2 = _kg2 + 0.5;
    update();
  }

  void onRemovekg2() {
    if (_kg2 > 0) {
      _kg2 = _kg2 - 0.5;
    }
    update();
  }

  // Add function to one
  void onAddkg3() {
    _kg3 = _kg3 + 0.5;
    update();
  }

  void onRemovekg3() {
    if (_kg3 > 0) {
      _kg3 = _kg3 - 0.5;
    }
    update();
  }

  // Add function to one
  void onAddkg4() {
    _kg4 = _kg4 + 0.5;
    update();
  }

  void onRemovekg4() {
    if (_kg4 > 0) {
      _kg4 = _kg4 - 0.5;
    }
    update();
  }

  // Add function to one
  void onAddkg5() {
    _kg5 = _kg5 + 0.5;
    update();
  }

  void onRemovekg5() {
    if (_kg5 > 0) {
      _kg5 = _kg5 - 0.5;
    }
    update();
  }

  // Add function to one
  void onAddkg6() {
    _kg6 = _kg6 + 0.5;
    update();
  }

  void onRemovekg6() {
    if (_kg6 > 0) {
      _kg6 = _kg6 - 0.5;
    }
    update();
  }

  // Add function to one
  void onAddkg7() {
    _kg7 = _kg7 + 0.5;
    update();
  }

  void onRemovekg7() {
    if (_kg7 > 0) {
      _kg7 = _kg7 - 0.5;
    }
    update();
  }

  // Add function to one
  void onAddkg8() {
    _kg8 = _kg8 + 0.5;
    update();
  }

  void onRemovekg8() {
    if (_kg8 > 0) {
      _kg8 = _kg8 - 0.5;
    }
    update();
  }

  // Add function to one
  void onAddkg9() {
    _kg9 = _kg9 + 0.5;
    update();
  }

  void onRemovekg9() {
    if (_kg9 > 0) {
      _kg9 = _kg9 - 0.5;
    }
    update();
  }

  // Add function to one
  void onAddkg10() {
    _kg10 = _kg10 + 0.5;
    update();
  }

  void onRemovekg10() {
    if (_kg10 > 0) {
      _kg10 = _kg10 - 0.5;
    }
    update();
  }

  // Add function to one
  void onAddinCounter1() {
    _incounter1 = _incounter1 + 1;
    update();
    print(_counter1);
  }

  void onRemoveinCounter1() {
    if (_incounter1 > 0) {
      _incounter1 = _incounter1 - 1;
    }
    update();
    print(_counter1);
  }

  // Add function to one
  void onAddinCounter2() {
    _incounter2 = _incounter2 + 1;
    update();
  }

  void onRemoveinCounter2() {
    if (_incounter2 > 0) {
      _incounter2 = _incounter2 - 1;
    }
    update();
  }

  // Add function to one
  void onAddinCounter3() {
    _incounter3 = _incounter3 + 1;
    update();
  }

  void onRemoveinCounter3() {
    if (_incounter3 > 0) {
      _incounter3 = _incounter3 - 1;
    }
    update();
  }

  // Add function to one
  void onAddinCounter4() {
    _incounter4 = _incounter4 + 1;
    update();
  }

  void onRemoveinCounter4() {
    if (_incounter4 > 0) {
      _incounter4 = _incounter4 - 1;
    }
    update();
  }

  // Add function to one
  void onAddinCounter5() {
    _incounter5 = _incounter5 + 1;
    update();
  }

  void onRemoveinCounter5() {
    if (_incounter5 > 0) {
      _incounter5 = _incounter5 - 1;
    }
    update();
  }

  // Add function to one
  void onAddinCounter6() {
    _incounter6 = _incounter6 + 1;
    update();
  }

  void onRemoveinCounter6() {
    if (_incounter6 > 0) {
      _incounter6 = _incounter6 - 1;
    }
    update();
  }

  // Add function to one
  void onAddinCounter7() {
    _incounter7 = _incounter7 + 1;
    update();
  }

  void onRemoveinCounter7() {
    if (_incounter7 > 0) {
      _incounter7 = _incounter7 - 1;
    }
    update();
  }

  // Add function to one
  void onAddinCounter8() {
    _incounter8 = _incounter8 + 1;
    update();
  }

  void onRemoveinCounter8() {
    if (_incounter8 > 0) {
      _incounter8 = _incounter8 - 1;
    }
    update();
  }

  // Add function to one
  void onAddinCounter9() {
    _incounter9 = _incounter9 + 1;
    update();
  }

  void onRemoveinCounter9() {
    if (_incounter9 > 0) {
      _incounter9 = _incounter9 - 1;
    }
    update();
  }

  // Add function to one
  void onAddinCounter10() {
    _incounter10 = _incounter10 + 1;
    update();
  }

  void onRemoveinCounter10() {
    if (_incounter10 > 0) {
      _incounter10 = _incounter10 - 1;
    }
    update();
  }

  // Add function to one
  void onAddinkg1() {
    _inkg1 = _inkg1 + 0.5;
    update();
    print(_counter1);
  }

  void onRemoveinkg1() {
    if (_inkg1 > 0) {
      _inkg1 = _inkg1 - 0.5;
    }
    update();
    print(_counter1);
  }

  // Add function to one
  void onAddinkg2() {
    _inkg2 = _inkg2 + 0.5;
    update();
  }

  void onRemoveinkg2() {
    if (_inkg2 > 0) {
      _inkg2 = _inkg2 - 0.5;
    }
    update();
  }

  // Add function to one
  void onAddinkg3() {
    _inkg3 = _inkg3 + 0.5;
    update();
  }

  void onRemoveinkg3() {
    if (_inkg3 > 0) {
      _inkg3 = _inkg3 - 0.5;
    }
    update();
  }

  // Add function to one
  void onAddinkg4() {
    _inkg4 = _inkg4 + 0.5;
    update();
  }

  void onRemoveinkg4() {
    if (_inkg4 > 0) {
      _inkg4 = _inkg4 - 0.5;
    }
    update();
  }

  // Add function to one
  void onAddinkg5() {
    _inkg5 = _inkg5 + 0.5;
    update();
  }

  void onRemoveinkg5() {
    if (_inkg5 > 0) {
      _inkg5 = _inkg5 - 0.5;
    }
    update();
  }

  // Add function to one
  void onAddinkg6() {
    _inkg6 = _inkg6 + 0.5;
    update();
  }

  void onRemoveinkg6() {
    if (_inkg6 > 0) {
      _inkg6 = _inkg6 - 0.5;
    }
    update();
  }

  // Add function to one
  void onAddinkg7() {
    _inkg7 = _inkg7 + 0.5;
    update();
  }

  void onRemoveinkg7() {
    if (_inkg7 > 0) {
      _inkg7 = _inkg7 - 0.5;
    }
    update();
  }

  // Add function to one
  void onAddinkg8() {
    _inkg8 = _inkg8 + 0.5;
    update();
  }

  void onRemoveinkg8() {
    if (_inkg8 > 0) {
      _inkg8 = _inkg8 - 0.5;
    }
    update();
  }

  // Add function to one
  void onAddinkg9() {
    _inkg9 = _inkg9 + 0.5;
    update();
  }

  void onRemoveinkg9() {
    if (_inkg9 > 0) {
      _inkg9 = _inkg9 - 0.5;
    }
    update();
  }

  // Add function to one
  void onAddinkg10() {
    _inkg10 = _inkg10 + 0.5;
    update();
  }

  void onRemoveinkg10() {
    if (_inkg10 > 0) {
      _inkg10 = _inkg10 - 0.5;
    }
    update();
  }

  void calculateIterations(
      {@required int typeIned,
      @required int hits,
      @required String sessionName}) {
    double numerG = 0;
    double numerK = 0;
    double numerR = 0;
    // Primero buscamos el tiempo total
    var minutC = _minute * 60;
    var timeCom = minutC + _seconds;

    print(timeCom);

    // Ahora calculamos el KG x Ser
    var kgxser1 = _counter1 * _kg1;
    var kgxser2 = _counter2 * _kg2;
    var kgxser3 = _counter3 * _kg3;
    var kgxser4 = _counter4 * _kg4;
    var kgxser5 = _counter5 * _kg5;
    var kgxser6 = _counter6 * _kg6;
    var kgxser7 = _counter7 * _kg7;
    var kgxser8 = _counter8 * _kg8;
    var kgxser9 = _counter9 * _kg9;
    var kgxser10 = _counter10 * _kg10;
    var inkgxser1 = _incounter1 * _inkg1;
    var inkgxser2 = _incounter2 * _inkg2;
    var inkgxser3 = _incounter3 * _inkg3;
    var inkgxser4 = _incounter4 * _inkg4;
    var inkgxser5 = _incounter5 * _inkg5;
    var inkgxser6 = _incounter6 * _inkg6;
    var inkgxser7 = _incounter7 * _inkg7;
    var inkgxser8 = _incounter8 * _inkg8;
    var inkgxser9 = _incounter9 * _inkg9;
    var inkgxser10 = _incounter10 * _inkg10;

    // Ahora calculamos los Kilogramos totales de una fila

    var ttlKG1 = kgxser1 * _rounds;
    var ttlKG2 = kgxser2 * _rounds;
    var ttlKG3 = kgxser3 * _rounds;
    var ttlKG4 = kgxser4 * _rounds;
    var ttlKG5 = kgxser5 * _rounds;
    var ttlKG6 = kgxser6 * _rounds;
    var ttlKG7 = kgxser7 * _rounds;
    var ttlKG8 = kgxser8 * _rounds;
    var ttlKG9 = kgxser9 * _rounds;
    var ttlKG10 = kgxser10 * _rounds;
    var inttlKG1 = inkgxser1 * _rounds;
    var inttlKG2 = inkgxser2 * _rounds;
    var inttlKG3 = inkgxser3 * _rounds;
    var inttlKG4 = inkgxser4 * _rounds;
    var inttlKG5 = inkgxser5 * _rounds;
    var inttlKG6 = inkgxser6 * _rounds;
    var inttlKG7 = inkgxser7 * _rounds;
    var inttlKG8 = inkgxser8 * _rounds;
    var inttlKG9 = inkgxser9 * _rounds;
    var inttlKG10 = inkgxser10 * _rounds;

    // Ahora sumamos todos los kilos totales

    var totalKilos = ttlKG1 +
        ttlKG2 +
        ttlKG3 +
        ttlKG4 +
        ttlKG5 +
        ttlKG6 +
        ttlKG7 +
        ttlKG8 +
        ttlKG9 +
        ttlKG10 +
        inttlKG1 +
        inttlKG2 +
        inttlKG3 +
        inttlKG4 +
        inttlKG5 +
        inttlKG6 +
        inttlKG7 +
        inttlKG8 +
        inttlKG9 +
        inttlKG10;

    print(totalKilos);

    // Ahora calculamos el total de las repeticiones de una fila

    var ttlReps1 = _counter1 * _rounds;
    var ttlReps2 = _counter2 * _rounds;
    var ttlReps3 = _counter3 * _rounds;
    var ttlReps4 = _counter4 * _rounds;
    var ttlReps5 = _counter5 * _rounds;
    var ttlReps6 = _counter6 * _rounds;
    var ttlReps7 = _counter7 * _rounds;
    var ttlReps8 = _counter8 * _rounds;
    var ttlReps9 = _counter9 * _rounds;
    var ttlReps10 = _counter10 * _rounds;

    var inttlReps1 = _incounter1;
    var inttlReps2 = _incounter2;
    var inttlReps3 = _incounter3;
    var inttlReps4 = _incounter4;
    var inttlReps5 = _incounter5;
    var inttlReps6 = _incounter6;
    var inttlReps7 = _incounter7;
    var inttlReps8 = _incounter8;
    var inttlReps9 = _incounter9;
    var inttlReps10 = _incounter10;

    // Sumamos el total de las repeticiones

    var totalReps = ttlReps1 +
        ttlReps2 +
        ttlReps3 +
        ttlReps4 +
        ttlReps5 +
        ttlReps6 +
        ttlReps7 +
        ttlReps8 +
        ttlReps9 +
        ttlReps10 +
        inttlReps1 +
        inttlReps2 +
        inttlReps3 +
        inttlReps4 +
        inttlReps5 +
        inttlReps6 +
        inttlReps7 +
        inttlReps8 +
        inttlReps9 +
        inttlReps10;

    print(totalReps);

    // Calculamos el IRK

    double irk1 = totalKilos / timeCom;

    // print('El IRK es de $irk1');

    // Calculamos el IRR

    double irr1 = totalReps / timeCom * 10;

    // print('El IRR es de $irr1');

    // Calculamos el IRG

    double irg1 = irk1 + irr1;

    // print('El IRG es de $irg1');

    var data = {
      'IRG${hitses.length + 1}': irg1,
      'IRK${hitses.length + 1}': irk1,
      'IRR${hitses.length + 1}': irr1,
    };

    print(hits);
    print(hitses.length);
    for (var cont = 0; cont < hitses.length; cont++) {
      if (hitses.length > 0) {
        numerG = numerG + hitses[cont]['IRG${cont + 1}'];
        numerR = numerR + hitses[cont]['IRR${cont + 1}'];
        numerK = numerK + hitses[cont]['IRK${cont + 1}'];
      }
      update();
    }

    if (hitses.length < hits) {
      hitses.add(data);
      Get.back();
      Get.to(
          AddResult(hits: hits, typeInde: typeIned, sessionName: sessionName));
    } else {
      buttonSheetIndices(numerK, numerR, numerG, hitses, sessionName);
    }
  }

  // Abrir el buttombarshee una vez cargados los datos

  void buttonSheetIndices(
    double irk,
    double irr,
    double irg,
    List<dynamic> hits,
    String sessionName,
  ) {
    List<Row> irs = [];
    List<double> irgs = [];
    List<double> irks = [];
    List<double> irrs = [];
    List<Row> irsK = [];
    List<Row> irsR = [];
    print(hits);
    for (var i = 0; i < hits.length; i++) {
      irgs.add(hits[i]['IRG${i + 1}']);
      irks.add(hits[i]['IRK${i + 1}']);
      irrs.add(hits[i]['IRR${i + 1}']);

      irsK.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'IRK${i + 1}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            '${hits[i]['IRK${i + 1}'].toStringAsFixed(1)}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ));
      irsR.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'IRR${i + 1}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            '${hits[i]['IRR${i + 1}'].toStringAsFixed(1)}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ));

      irs.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'IRG${i + 1}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            '${hits[i]['IRG${i + 1}'].toStringAsFixed(1)}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ));
    }

    Get.dialog(Dialog(
      child: Container(
        // height: 200,

        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Text(
              'Tus indices por kilo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Divider(
              thickness: 1.0,
              color: Colors.black45,
            ),
            Column(children: irsK),
            Text(
              'Tus indices por repeticion',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Divider(
              thickness: 1.0,
              color: Colors.black45,
            ),
            Column(children: irsR),
            Text(
              'Tus indices generales',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Divider(
              thickness: 1.0,
              color: Colors.black45,
            ),
            Column(children: irs),
            SizedBox(
              height: 10,
            ),
            Text(
              'Tus indices totales',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Divider(
              thickness: 1.0,
              color: Colors.black45,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'IRK',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  '${irk.toStringAsFixed(1)}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'IRR',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  '${irr.toStringAsFixed(1)}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'IRG',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  '${irg.toStringAsFixed(1)}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Color(0xffdfdddd),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text('Cancelar'),
                    ),
                  ),
                ),
                ButtonPrimary(
                    height: 40,
                    width: 90,
                    text: 'Guardar',
                    onPressed: () {
                      print(irgs);
                      print(irks);
                      print(irrs);

                      var data = {
                        'IRGS': irgs,
                        'IRKS': irks,
                        'IRRS': irrs,
                        'IRGG': irg,
                        'IRKG': irk,
                        'IRRG': irr,
                        'sesionName': sessionName,
                        'userID': usere.uid,
                        'date': DateTime.now(),
                      };

                      FirebaseFirestore.instance
                          .collection('tabulate')
                          .add(data)
                          .then((value) => {Get.back(), Get.back()});
                    })
              ],
            )
          ],
        ),
      ),
    ));
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
    print(_count1);
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
