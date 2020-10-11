import 'package:flutter/material.dart';

class InfoProfile extends StatelessWidget {

  String imagePath;
  String nameU;

  InfoProfile({this.imagePath, this.nameU});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('¡Bienvenido ${nameU.split(' ')[0]}!',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                Text('¿Listo para medir\n los resultados de hoy?',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                )
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
            ),
            child: ClipRRect(
                
               borderRadius: BorderRadius.circular(20),
                child: Image.network(imagePath)),
          )
        ],
      ),
    );
  }
}