import 'package:flutter/material.dart';

class ShowProgressBar extends StatelessWidget {
  const ShowProgressBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        backgroundColor: Colors.red,
      ),
    );
  }
}
