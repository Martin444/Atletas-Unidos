import 'package:atletasunidos/Widgets/Events/Banner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class BannerList extends StatefulWidget {
  @override
  _BannerListState createState() => _BannerListState();
}

class _BannerListState extends State<BannerList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('events').orderBy('date',descending: false).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if(snapshot.hasData){
          List<BannerCard> eventList = new List();

          snapshot.data.docs.forEach((element) {
            var dateTimer = (element['date'] as Timestamp).toDate();
            var title = element['title'];
            var eventId = element.id;
            var foto = element['photoUrl'];
            var idexg = element['description'];
            var formaterDate = DateFormat.yMMMd().format(dateTimer);
            // eventList.add(idexg);

            // datex.getNumbermore(listir);
            
            
              eventList.add(BannerCard(title: title, photoURL: foto, description: idexg, fecha: dateTimer, eventID: eventId,));
              
          });


          return Container(
            margin: EdgeInsets.all(5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: eventList,
              ),
            ),
          );
        } else {
          return Container(

          );
        }

      
      
      }
    );
  }
}