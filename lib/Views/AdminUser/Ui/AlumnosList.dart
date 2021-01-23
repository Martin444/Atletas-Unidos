import 'package:atletasunidos/Widgets/UserTile.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AlumnosList extends StatefulWidget {
  @override
  _AlumnosListState createState() => _AlumnosListState();
}

class _AlumnosListState extends State<AlumnosList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackPrimary,
      appBar: AppBar(
        elevation: 0,
        title: Text('Alumnos',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0,
              fontFamily: "Lato",
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

          if(snapshot.hasData){
            List<UserTile> ulist = new List();

            snapshot.data.docs.forEach((element) {
                var namet = element['name'];
                var uid = element['uid'];
                var photo = element['photoURL'];
                var admin = element.data()['doctor'] == null ? 1 : element.data()['doctor'];

                ulist.add(UserTile(name: namet, uid: uid, photo: photo, admin: admin,));

            });


            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                     Container(
                        child: Text('Dale check a tus alumnos de AS',
                          style: TextStyle(
                          fontSize: 23.0,
                          fontFamily: "Lato",
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                        ),
                      ),
                    SizedBox(height: 20,),
                    Column(
                      children: ulist,
                    )

                  ],

                ),
              ),
            );
          } else {
            return Container();
          }

        
        }
      ),
    );
  }
}