import 'package:ecommerce/src/homepage/griditems.dart';
import 'package:ecommerce/src/homepage/progressbar.dart';
import 'package:ecommerce/src/model/entrymodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

// import contentstack package below.
import 'package:contentstack/contentstack.dart' as contentstack;

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Lamp> lamps = [];

  @override
  void initState() {
    getLamps();
    super.initState();
  }

  Future getLamps() async {
    final stack = contentstack.Stack('blt02532e5510d39dec', 'cs253acbe45719247760e342eb', 'mobile');
    final query = stack.contentType('ecommerce_app_android').entry().query();
    await query.find().then((response) {
      setState(() {
        final listObj = response['entries'];
        for(Map<String, dynamic> lamp in listObj){
          lamps.add(Lamp.fromJson(lamp));
        }
      });
    }).catchError((error){
      print(error.toString());
      return Center(
        child: Text('Could Not Fetch Data: $error'),
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

