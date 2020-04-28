import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'lamp.dart';
import 'widget.dart';

class PageDetail extends StatefulWidget {
  PageDetail({Key key, this.lamp, this.lampList}) : super(key: key);
  final Lamp lamp;
  final List<Lamp> lampList;
  @override
  _PageDetailState createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  var isLargeScreen;

  Widget buildTiles(Lamp lamp) {
    return Container(
      width: 220,
      child: Card(
        elevation: 1.0,
        margin: EdgeInsets.all(8),
        child: GridTile(
          header: Container(
              padding: EdgeInsets.only(right: 10, top: 10),
              alignment: Alignment.centerRight,
              child: roundCircleIcon(Icons.favorite_border)),
          child: Image.network(lamp.imageUrl),
          footer: Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.all(4),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    if (MediaQuery.of(context).size.width > 600) {
      isLargeScreen = true;
    } else {
      isLargeScreen = false;
    }

    //return isLargeScreen? _buildTabletLayout() : _buildMobileLayout();

//    Size size = MediaQuery.of(context).size;
//    double width = size.width > size.height ? size.height : size.width;
//
//    if(width > 600) {
//      // Do something for tablets here
//      //return _buildTabletLayout();
//    } else {
//      // Do something for phones
//      //return _buildMobileLayout();
//    }

    return Scaffold(
      body: Container(
        //padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Top Full Image
            Image.network(
              widget.lamp.imageUrl,
              width: double.infinity,
              height: screen.height / 2,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        //color: Colors.grey[400],
                        //padding: EdgeInsets.all(8),
                        child: Text(
                          "Price: ${widget.lamp.price}",
                          style: boldTextStyle(),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        widget.lamp.title,
                        style: boldTextStyle(),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ratingBar(),
                          SizedBox(width: 10),
                          Text('1902 Rating'),
                        ],
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    onPressed: () => debugPrint('Tapped'),
                    elevation: 2,
                    color: Colors.redAccent,
                    child: Text('BUY', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                )
              ],
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100)),
                  color: Colors.redAccent,
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 50, top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('Suggested for you', style: boldWhiteTextStyle()),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Flexible(
                      fit: FlexFit.tight,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.lampList.length,
                        itemBuilder: (context, index){
                          return buildTiles(widget.lampList[index]);
                        },
                      ),
                    )
                  ],
                  //padding: EdgeInsets.all(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
