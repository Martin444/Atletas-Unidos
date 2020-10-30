import 'package:atletasunidos/Controllers/Homecontroller.dart';
import 'package:atletasunidos/Widgets/ButtonPrimary.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:atletasunidos/Widgets/counterInput.dart';
import 'package:atletasunidos/Widgets/text_input.dart';
import 'package:atletasunidos/Widgets/text_input_location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddResult extends StatefulWidget {




  @override
  _AddResultState createState() => _AddResultState();
}

class _AddResultState extends State<AddResult> {
  


  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeControllers>(
      init: HomeControllers(),
      builder: (_) {
        return Scaffold(
          backgroundColor: blackPrimary,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 60,),
                    Text('Agrega nuevos resultados',
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
                        print('hola');
                        _.onAddRounds();
                      },
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.white,
                    ),

                    Column(
                      children: _.getList1(),
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
                      children: _.getList2(),
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

                      }),
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