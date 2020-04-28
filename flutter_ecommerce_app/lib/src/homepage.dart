import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'lamp.dart';
import 'pagedetail.dart';
import 'widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Lamp> loadLamp = [];
  void _onTileClicked(Lamp lamp) {
    debugPrint("Lamp: ${lamp.title}");
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PageDetail(lamp: lamp, lampList: loadLamp)),
    );
  }

  List<Widget> getTiles(List<Lamp> lampList) {
    final List<Widget> tiles = <Widget>[];
    for (var lamp in lampList) {
      tiles.add(Card(
        elevation: 2.0,
        //margin: EdgeInsets.all(8),
        child: GridTile(
          header: Container(
              padding: EdgeInsets.only(right: 8, top: 8),
              alignment: Alignment.centerRight,
              child: roundCircleIcon(Icons.favorite_border)),
          child: new InkResponse(
            splashColor: Colors.grey,
            child: Image.network(lamp.imageUrl),
            onTap: () => _onTileClicked(lamp),
          ),
          footer: Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              //color: Colors.grey[200],
              //padding: EdgeInsets.all(4),
              child: Container(
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(lamp.title, style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text("Price: ${lamp.price}")
                  ],
                ),
              ),
            ),
          ),
        ),
      ));
    }
    return tiles;
  }

  @override
  void initState() {
    //https://toppng.com/uploads/preview/bed-side-lamp-11549914969y7hihivxmm.png
    loadLamp.add(Lamp(
        'Arya table lamp',
        'https://atlas-content-cdn.pixelsquid.com/stock-images/desk-lamp-z0Ad92F-600.jpg',
        false,
        '\$744'));
    loadLamp.add(Lamp(
        'Love birds table lamp',
        'https://atlas-content-cdn.pixelsquid.com/stock-images/desk-lamp-z0Ad92F-600.jpg',
        true,
        '\$470'));
    loadLamp.add(Lamp(
        'Shine wall lamp',
        'https://atlas-content-cdn.pixelsquid.com/stock-images/desk-lamp-z0Ad92F-600.jpg',
        false,
        '\$231'));
    loadLamp.add(Lamp(
        'Ancient Indian lamp',
        'https://atlas-content-cdn.pixelsquid.com/stock-images/desk-lamp-z0Ad92F-600.jpg',
        false,
        '\$834'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 2.0,
        title: Text(
          'Lamp',
          style: boldTextStyle(),
        ),
        //leading: Icon(Icons.linked_camera),
        centerTitle: true,
        //renderActionBar(context, "Lamp"),
      ),
      body: Container(
        child: OrientationBuilder(builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            childAspectRatio: 1.0,
            padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            children: getTiles(loadLamp),
          );
        }),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
