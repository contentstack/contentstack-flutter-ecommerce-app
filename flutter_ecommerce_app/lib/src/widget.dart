import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

final cardDecoration = BoxDecoration(
    color: Colors.grey[500],
    border: Border.all(style: BorderStyle.solid, color: Colors.grey),
    backgroundBlendMode: BlendMode.darken);

Widget renderActionBar(BuildContext context, String centerTitle) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      roundCircleIcon(Icons.linked_camera),
      Text(centerTitle, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      roundCircleIcon(Icons.favorite_border),
    ],
  );
}

Widget roundCircleIcon(IconData icons) {
  return CircleAvatar(
    backgroundColor: Colors.grey[200],
    child: Icon(
      icons,
      color: Colors.grey[500],
      size: 20,
    ),
  );
}

Widget ratingBar() {
  return FlutterRatingBar(
    initialRating: 4,
    fillColor: Colors.amber,
    itemSize: 20,
    borderColor: Colors.amber.withAlpha(50),
    allowHalfRating: true,
    onRatingUpdate: (rating) {
      print(rating);
    },
  );
}

TextStyle boldTextStyle() {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.black,
  );
}

TextStyle boldWhiteTextStyle() {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.white,
  );
}

