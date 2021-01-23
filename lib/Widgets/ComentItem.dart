import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComentItem extends StatefulWidget {

  String name;
  String photo;
  String content;

  ComentItem({this.name, this.content, this.photo});

  @override
  _ComentItemState createState() => _ComentItemState();
}

class _ComentItemState extends State<ComentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.photo),
            ),
          ),
          SizedBox(width: 10,),
          Container(
            width: Get.width - 100,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.name}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  '${widget.content}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}