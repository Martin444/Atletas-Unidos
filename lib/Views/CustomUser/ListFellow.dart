import 'package:atletasunidos/Widgets/UserTile.dart';
import 'package:flutter/material.dart';


class ListFellow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          UserTile(),
          UserTile(),
          UserTile(),
          UserTile(),
          UserTile(),
          UserTile(),
          UserTile(),
        ],
      ),
    );
  }
}