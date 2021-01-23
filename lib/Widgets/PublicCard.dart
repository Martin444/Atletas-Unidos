import 'package:atletasunidos/Controllers/Homecontroller.dart';
import 'package:atletasunidos/Widgets/PublicsComents.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublicCard extends StatefulWidget {
  String name;
  String publicID;
  String photoUrl;
  String photoPot;
  String uid;
  String conten;
  List<dynamic> likes;

  PublicCard({this.name, this.uid, this.conten, this.likes, this.photoUrl, this.photoPot, this.publicID});

  @override
  _PublicCardState createState() => _PublicCardState();
}

class _PublicCardState extends State<PublicCard> {
  var myInfo = Get.find<HomeControllers>();

  @override
  Widget build(BuildContext context) {

    var myLike = widget.likes.indexOf(myInfo.usere.uid);
    
    
   
    return Container(
      child: Stack(
        alignment: Alignment(0.1,2.5),
        children: [
         

          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(widget.photoUrl),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(widget.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                          ),
                    ],
              ),
                  
                  ],
                ),
              
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(widget.conten,
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                ),

                 Container(
                   width: Get.width,
                  //  maxHeight: 300,
                  margin: EdgeInsets.only(bottom: 10),
                   child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(widget.photoPot),
                ),
                 ),

                
                    Container(
                      child: Row(
                        children: [
                          Row(
                            children: [
                              
                              myLike >= 0 ?
                              InkWell(
                                onTap: (){
                                  var newList = widget.likes.remove(myInfo.usere.uid);
                                  if(newList){
                                    FirebaseFirestore.instance.collection('publics')
                                      .doc(widget.publicID).set({
                                        'likes' : widget.likes
                                      }, SetOptions(merge: true));
                                  }
                                },
                                child: Icon(Icons.favorite, size: 30, color: Colors.red,)
                              )
                              :

                              InkWell(
                                onTap: (){
                                   widget.likes.add(myInfo.usere.uid);
                                     FirebaseFirestore.instance.collection('publics')
                                      .doc(widget.publicID).set({
                                        'likes' : widget.likes
                                      }, SetOptions(merge: true));
                                  print(widget.likes);
                                },
                                child: Icon(Icons.favorite_border, size: 30,)
                              ),
                              SizedBox(width: 4,),
                              Text('${widget.likes.length}',
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                           SizedBox(width: 10,),
                        
                          Row(
                            children: [
                              InkWell(
                                onTap: (){
                                   Get.to(PublicComents(publicID: widget.publicID),
                                    transition: Transition.downToUp,
                                    duration: Duration(milliseconds: 500)
                                   );
                                },
                                child: Icon(Icons.comment, size: 30, color: Colors.blueGrey,)
                              ),
                              SizedBox(width: 4,),
                              // Text('${widget.likes.length}',
                              //   style: TextStyle(
                              //     fontSize: 19,
                              //     color: Colors.black,
                              //     fontWeight: FontWeight.bold
                              //   ),
                              // ),
                            ],
                          ),
                        
                        
                        ],
                      ),
                    )

                    
              ],
            ),
          )
        ],
      ),
    );
  }
}