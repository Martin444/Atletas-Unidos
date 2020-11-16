import 'package:atletasunidos/Controllers/HitBController.dart';
import 'package:atletasunidos/Controllers/Homecontroller.dart';
import 'package:atletasunidos/Widgets/ButtonPrimary.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:atletasunidos/Widgets/counterColumn.dart';
import 'package:atletasunidos/Widgets/counterInput.dart';
import 'package:atletasunidos/Widgets/text_input.dart';
import 'package:atletasunidos/Widgets/text_input_location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddHitBResult extends StatefulWidget {
  @override
  _AddHitBResultState createState() => _AddHitBResultState();
}

class _AddHitBResultState extends State<AddHitBResult> {

  var tabuler = Get.find<HomeControllers>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HitBController>(
      init: HitBController(),
      builder: (_) {
        return Scaffold(
          backgroundColor: blackPrimary,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 60,),
                    Text('Agrega resultados HIT B',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold
                        ),
                    ),
                    SizedBox(height: 20,),
                    TextInputLocation(
                      hintText: 'Sessión', 
                      iconData: null, 
                      controller: _.session),
                    SizedBox(height: 20,),
                    Container(
                      child: Text('Tiempo',
                        style: TextStyle(
                            fontSize: 19.0,
                            fontFamily: "Lato",
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    CounterInput(
                      title: 'Minutos',
                      counter: _.minute,
                      onRemuve:(){
                         _.onRemoveMinutes();
                      },
                      onAdded: (){
                        print('hola');
                        _.onAddMinutes();
                      },
                    ),
                    SizedBox(height: 10,),
                    CounterInput(
                      title: 'Segundos',
                      counter: _.seconds,
                      onRemuve:(){
                         _.onRemoveSeconds();
                      },
                      onAdded: (){
                        _.onAddSeconds();
                      },
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.white,
                    ),
                    // SizedBox(height: 10,),
                    CounterInput(
                      title: 'Rounds',
                      counter: _.rounds,
                      onRemuve:(){
                         _.onRemoveRounds();
                      },
                      onAdded: (){
                        
                        _.onAddRounds();
                      },
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.white,
                    ),

                      Column(
                        children: [
                          // Primer contadors
                          _.count1 >= 1 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.counter1,
                                      onAdd: (){
                                        _.onAddCounter1();
                                      },
                                      onRemove: (){
                                        _.onRemoveCounter1();
                                      },
                                    ),


                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.kg1,
                                      onAdd: (){
                                        _.onAddkg1();
                                      },
                                      onRemove: (){
                                        _.onRemovekg1();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(),
                          // segundo contadors
                          _.count1 >= 2 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.counter2,
                                      onAdd: (){
                                        _.onAddCounter2();
                                      },
                                      onRemove: (){
                                        _.onRemoveCounter2();
                                      },
                                    ),
                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.kg2,
                                      onAdd: (){
                                        _.onAddkg2();
                                      },
                                      onRemove: (){
                                        _.onRemovekg2();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(
                              
                            ),
                          // tercer contadors
                          _.count1 >= 3 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.counter3,
                                      onAdd: (){
                                        _.onAddCounter3();
                                      },
                                      onRemove: (){
                                        _.onRemoveCounter3();
                                      },
                                    ),
                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.kg3,
                                      onAdd: (){
                                        _.onAddkg3();
                                      },
                                      onRemove: (){
                                        _.onRemovekg3();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(),
                          // Cuarto contadors
                          _.count1 >= 4 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.counter4,
                                      onAdd: (){
                                        _.onAddCounter4();
                                      },
                                      onRemove: (){
                                        _.onRemoveCounter4();
                                      },
                                    ),
                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.kg4,
                                      onAdd: (){
                                        _.onAddkg4();
                                      },
                                      onRemove: (){
                                        _.onRemovekg4();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(
                              
                            ),
                          // Quinto contadors
                          _.count1 >= 5 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.counter5,
                                      onAdd: (){
                                        _.onAddCounter5();
                                      },
                                      onRemove: (){
                                        _.onRemoveCounter5();
                                      },
                                    ),
                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.kg5,
                                      onAdd: (){
                                        _.onAddkg5();
                                      },
                                      onRemove: (){
                                        _.onRemovekg5();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(),
                          // Sexto contadors
                          _.count1 >= 6 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.counter6,
                                      onAdd: (){
                                        _.onAddCounter6();
                                      },
                                      onRemove: (){
                                        _.onRemoveCounter6();
                                      },
                                    ),
                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.kg6,
                                      onAdd: (){
                                        _.onAddkg6();
                                      },
                                      onRemove: (){
                                        _.onRemovekg6();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(),
                          // Septimo contadors
                          _.count1 >= 7 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.counter7,
                                      onAdd: (){
                                        _.onAddCounter7();
                                      },
                                      onRemove: (){
                                        _.onRemoveCounter7();
                                      },
                                    ),
                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.kg7,
                                      onAdd: (){
                                        _.onAddkg7();
                                      },
                                      onRemove: (){
                                        _.onRemovekg7();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(),
                          // Octavo contadors
                          _.count1 >= 8 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.counter8,
                                      onAdd: (){
                                        _.onAddCounter8();
                                      },
                                      onRemove: (){
                                        _.onRemoveCounter8();
                                      },
                                    ),
                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.kg8,
                                      onAdd: (){
                                        _.onAddkg8();
                                      },
                                      onRemove: (){
                                        _.onRemovekg8();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(
                              
                            ),
                          // Noveno contadors
                          _.count1 >= 9 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.counter9,
                                      onAdd: (){
                                        _.onAddCounter9();
                                      },
                                      onRemove: (){
                                        _.onRemoveCounter9();
                                      },
                                    ),
                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.kg9,
                                      onAdd: (){
                                        _.onAddkg9();
                                      },
                                      onRemove: (){
                                        _.onRemovekg9();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(
                              
                            ),
                          // Decimo contadors
                          _.count1 >= 10 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.counter10,
                                      onAdd: (){
                                        _.onAddCounter10();
                                      },
                                      onRemove: (){
                                        _.onRemoveCounter10();
                                      },
                                    ),
                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.kg10,
                                      onAdd: (){
                                        _.onAddkg10();
                                      },
                                      onRemove: (){
                                        _.onRemovekg10();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(
                              
                            ),
                        
                        ],
                      ),
                  
                                      

                    ButtonPrimary(
                      height: 40,
                      width: 100,
                      text: 'Agregar', 
                      onPressed: (){
                        _.updateList1();
                      }),
                    Divider(
                      thickness: 1.0,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10,),

                    Text('Rounds incompletos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold
                        ),
                    ),
                    SizedBox(height: 20,),
                    
                     Column(
                        children: [
                          // Primer contadors
                          _.count2 >= 1 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.incounter1,
                                      onAdd: (){
                                        _.onAddinCounter1();
                                      },
                                      onRemove: (){
                                        _.onRemoveinCounter1();
                                      },
                                    ),


                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.inkg1,
                                      onAdd: (){
                                        _.onAddinkg1();
                                      },
                                      onRemove: (){
                                        _.onRemoveinkg1();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(),
                          // segundo contadors
                          _.count2 >= 2 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.incounter2,
                                      onAdd: (){
                                        _.onAddinCounter2();
                                      },
                                      onRemove: (){
                                        _.onRemoveinCounter2();
                                      },
                                    ),
                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.inkg2,
                                      onAdd: (){
                                        _.onAddinkg2();
                                      },
                                      onRemove: (){
                                        _.onRemoveinkg2();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(
                              
                            ),
                          // tercer contadors
                          _.count2 >= 3 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.incounter3,
                                      onAdd: (){
                                        _.onAddinCounter3();
                                      },
                                      onRemove: (){
                                        _.onRemoveinCounter3();
                                      },
                                    ),
                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.inkg3,
                                      onAdd: (){
                                        _.onAddinkg3();
                                      },
                                      onRemove: (){
                                        _.onRemoveinkg3();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(),
                          // Cuarto contadors
                          _.count2 >= 4 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.incounter4,
                                      onAdd: (){
                                        _.onAddinCounter4();
                                      },
                                      onRemove: (){
                                        _.onRemoveinCounter4();
                                      },
                                    ),
                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.inkg4,
                                      onAdd: (){
                                        _.onAddinkg4();
                                      },
                                      onRemove: (){
                                        _.onRemoveinkg4();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(
                              
                            ),
                          // Quinto contadors
                          _.count2 >= 5 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.incounter5,
                                      onAdd: (){
                                        _.onAddinCounter5();
                                      },
                                      onRemove: (){
                                        _.onRemoveinCounter5();
                                      },
                                    ),
                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.inkg5,
                                      onAdd: (){
                                        _.onAddinkg5();
                                      },
                                      onRemove: (){
                                        _.onRemoveinkg5();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(),
                          // Sexto contadors
                          _.count2 >= 6 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.incounter6,
                                      onAdd: (){
                                        _.onAddinCounter6();
                                      },
                                      onRemove: (){
                                        _.onRemoveinCounter6();
                                      },
                                    ),
                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.inkg6,
                                      onAdd: (){
                                        _.onAddinkg6();
                                      },
                                      onRemove: (){
                                        _.onRemoveinkg6();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(),
                          // Septimo contadors
                          _.count2 >= 7 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.incounter7,
                                      onAdd: (){
                                        _.onAddinCounter7();
                                      },
                                      onRemove: (){
                                        _.onRemoveinCounter7();
                                      },
                                    ),
                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.inkg7,
                                      onAdd: (){
                                        _.onAddinkg7();
                                      },
                                      onRemove: (){
                                        _.onRemoveinkg7();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(),
                          // Octavo contadors
                          _.count2 >= 8 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.incounter8,
                                      onAdd: (){
                                        _.onAddinCounter8();
                                      },
                                      onRemove: (){
                                        _.onRemoveinCounter8();
                                      },
                                    ),
                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.inkg8,
                                      onAdd: (){
                                        _.onAddinkg8();
                                      },
                                      onRemove: (){
                                        _.onRemoveinkg8();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(
                              
                            ),
                          // Noveno contadors
                          _.count2 >= 9 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.incounter9,
                                      onAdd: (){
                                        _.onAddinCounter9();
                                      },
                                      onRemove: (){
                                        _.onRemoveinCounter9();
                                      },
                                    ),
                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.inkg9,
                                      onAdd: (){
                                        _.onAddinkg9();
                                      },
                                      onRemove: (){
                                        _.onRemoveinkg9();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(
                              
                            ),
                          // Decimo contadors
                          _.count2 >= 10 ?
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterColumn(
                                      title: 'Repeticiones',
                                      counter: _.incounter10,
                                      onAdd: (){
                                        _.onAddinCounter10();
                                      },
                                      onRemove: (){
                                        _.onRemoveinCounter10();
                                      },
                                    ),
                                    CounterColumn(
                                      title: 'Kg',
                                      counter: _.inkg10,
                                      onAdd: (){
                                        _.onAddinkg10();
                                      },
                                      onRemove: (){
                                        _.onRemoveinkg10();
                                      },
                                    ),
                                  ],
                                ),
                              )
                          :
                            Container(
                              
                            ),
                        
                        ],
                      ),

                    ButtonPrimary(
                      height: 40,
                      width: 100,
                      text: 'Agregar', 
                      onPressed: (){
                        _.updateList2();
                      }),

                    TextInput(
                      hintText: 'Comentarios', 
                      maxLines: 4,
                      inputType: TextInputType.multiline, 
                      controller: null
                    ),
                    SizedBox(height: 20,),
                    ButtonPrimary(
                      height: 40,
                      text: 'Confirmar',
                      onPressed: (){
                        _.session.text.length >= 3?
                        _.calculateIterations(tabuler.irkOne, tabuler.irrOne, tabuler.irgOne, tabuler.usere)
                        :
                        Get.snackbar('Nombre de Session', 'Por favor coloca un nombre a la session',colorText: Colors.white);
                      }
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
            ),
          ),
        );
      }
    );
  
  }
}