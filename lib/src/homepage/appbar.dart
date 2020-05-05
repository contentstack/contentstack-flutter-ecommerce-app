import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Appbar extends StatelessWidget {
  Appbar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[200],
      elevation: 0,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 25,
              child: Icon(Ionicons.ios_menu, color: Colors.black, size: 25),
            ),
            Text(
              title,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 25,
              child: Icon(
                Ionicons.ios_cart,
                color: Colors.black,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
