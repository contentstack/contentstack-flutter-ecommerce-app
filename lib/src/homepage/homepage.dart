import 'package:ecommerce/src/homepage/griditems.dart';
import 'package:ecommerce/src/homepage/progressbar.dart';
import 'package:ecommerce/src/model/entrymodel.dart';
import 'package:ecommerce/src/network/request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<EntryModel> lamps = [];

  @override
  void initState() {
    getLamps();
    super.initState();
  }

  getLamps() async {
    final network = Network();
    await network.getRequest<List<EntryModel>, EntryModel>().then((response) {
      //print(response);
      setState(() {
        lamps.addAll(response);
      });
    }).catchError((error) {
      print(error);
      return Center(
        child: Text('Could Not Fetch Data'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
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
                widget.title,
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
      ),
      body: lamps.length == 0
          ? ShowProgressBar()
          : GridItems(lamps: lamps, orientation: orientation),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('object'),
        tooltip: 'Increment',
        child: Icon(Icons.favorite),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

