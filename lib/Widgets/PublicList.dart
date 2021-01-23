import 'package:atletasunidos/Widgets/PublicCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PublicList extends StatefulWidget {
  @override
  _PublicListState createState() => _PublicListState();
}

class _PublicListState extends State<PublicList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('publics').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if(snapshot.hasData){
          List<PublicCard> cards = new List();
          snapshot.data.docs.forEach((element) {
            var publicID = element.id;
            var nameUser = element['userName'];
            var content = element['textconten'];
            var contenPot = element['photoConten'];
            var photo = element['userPhoto'];
            var likes = element['likes'];


            cards.add(PublicCard(name: nameUser, conten: content, photoUrl: photo, likes: likes, photoPot: contenPot, publicID: publicID,));
          });

          return Container(
            child: Column(
              children: cards,
            ),
          );
        }
      }
    );
  }
}