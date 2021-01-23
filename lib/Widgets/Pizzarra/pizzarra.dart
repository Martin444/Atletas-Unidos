import 'package:atletasunidos/Controllers/Homecontroller.dart';
import 'package:atletasunidos/Widgets/ButtonPrimary.dart';
import 'package:atletasunidos/Widgets/Pizzarra/UserTile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Pizzarra extends StatefulWidget {
  @override
  _PizzarraState createState() => _PizzarraState();
}

class _PizzarraState extends State<Pizzarra> {
  var dayTO = DateFormat.yMMMd().format(DateTime.now());
  var datex = Get.find<HomeControllers>();


  @override
  Widget build(BuildContext context) {



    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('pizarra').orderBy('IRG',descending: true).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {



        if(snapshot.hasData){
        List<UserPizarra> usersList = new List();
        List<double> listir = new List();
        snapshot.data.docs.forEach((element) {
          var dateTimer = (element['date'] as Timestamp).toDate();
          var named = element['userName'];
          var foto = element['userPhoto'];
          var idexg = element['IRG'];
          var formaterDate = DateFormat.yMMMd().format(dateTimer);
          listir.add(idexg);

          datex.getNumbermore(listir);
          
          formaterDate == dayTO ? 
            usersList.add(UserPizarra(name: named, photoURL: foto, irg: idexg,))
            :
            null;
        });
          return Container(
            child: Column(
              children: [
                Container(
            width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal:10),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Text('Pizarra del dia',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                        ),
                      ),
                    
                      Container(
                        padding: EdgeInsets.symmetric(vertical:10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Usuario',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                              ),
                            ),
                            Text('IRG',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: usersList,
                      ),

                      datex.usere.doctor == 2 ?

                        Container()
                      :
                        ButtonPrimary(text: 'Añadir datos', onPressed: (){
                          
                        })
                    ],
                  ),
                ),
              
              ],
            ),
          );
        } else {
          return Container();
        }

      }
    );
  }
}