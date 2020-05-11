import 'package:ecommerce/src/homepage/gridhorizontal.dart';
import 'package:ecommerce/src/model/entrymodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LampDetail extends StatefulWidget {
  LampDetail({
    Key key,
    this.lamp, this.lampList
  }) : super(key: key);

  final Lamp lamp;
  final List<Lamp> lampList;

  @override
  _LampDetailState createState() => _LampDetailState();
}

class _LampDetailState extends State<LampDetail> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                AntDesign.closecircle,
                color: Colors.amber,
                size: 30,
              ),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: screenSize.height / 2,
                  child: Image.network(widget.lamp.image['url']),
                ),
                Container(
                  color: Colors.grey[300],
                  child: SizedBox(
                    height: 1,
                    width: double.infinity,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.lamp.title,
                        style: boldTextStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(widget.lamp.description),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '\$ ${widget.lamp.price}',
                        style: boldTextStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey[300],
                  child: SizedBox(
                    height: 1,
                    width: double.infinity,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  child: Text(
                    'Some similar products...',
                    style: largeTextStyle,
                  ),
                ),
                Container(
                  child: SizedBox(
                      height: screenSize.height / 4,
                      width: double.infinity,
                      child: Container(
                        padding: EdgeInsets.only(left: 30),
                        child: GridHorizontal(lamps: widget.lampList),
                      )),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(60))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const boldTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
const largeTextStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 20);
