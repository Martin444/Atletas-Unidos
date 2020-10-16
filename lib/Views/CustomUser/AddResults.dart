import 'package:atletasunidos/Widgets/ButtonPrimary.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:atletasunidos/Widgets/text_input.dart';
import 'package:atletasunidos/Widgets/text_input_location.dart';
import 'package:flutter/material.dart';

class AddResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackPrimary,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40,),
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
                  controller: null),
                SizedBox(height: 20,),
                TextInputLocation(
                  hintText: 'Tiempo', 
                  iconData: null, 
                  controller: null),
                SizedBox(height: 20,),
                TextInputLocation(
                  hintText: 'Rounds', 
                  iconData: null, 
                  controller: null),
                SizedBox(height: 20,),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 130,
                      child: TextInputLocation(
                        hintText: 'Repeticiones', 
                        iconData: null, 
                        controller: null),
                    ),
                    Container(
                      width: 100,
                      child: TextInputLocation(
                        hintText: 'Kg', 
                        iconData: null, 
                        controller: null),
                    ),
                  ],
                ),

                SizedBox(height: 20,),
                ButtonPrimary(
                  height: 40,
                  width: 100,
                  text: 'Agregar', 
                  onPressed: (){

                  }),
                SizedBox(height: 20,),

                Text('Rounds incompletos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold
                    ),
                ),
                SizedBox(height: 20,),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 130,
                      child: TextInputLocation(
                        hintText: 'Repeticiones', 
                        iconData: null, 
                        controller: null),
                    ),
                    Container(
                      width: 100,
                      child: TextInputLocation(
                        hintText: 'Kg', 
                        iconData: null, 
                        controller: null),
                    ),
                  ],
                ),

                SizedBox(height: 20,),
                ButtonPrimary(
                  height: 40,
                  width: 100,
                  text: 'Agregar', 
                  onPressed: (){

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
}