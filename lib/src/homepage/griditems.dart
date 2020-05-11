import 'package:ecommerce/src/detailpage/lampdetail.dart';
import 'package:ecommerce/src/model/entrymodel.dart';
import 'package:flutter/material.dart';

class GridItems extends StatelessWidget {
  const GridItems({
    Key key,
    @required this.lamps,
    @required this.orientation,
  }) : super(key: key);

  final List<Lamp> lamps;
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: lamps.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LampDetail(lamp: lamps[index], lampList: lamps,)),
              );
            },
            child: new Card(
              //color: Colors.grey[200],
              clipBehavior: Clip.hardEdge,
              elevation: 3,
              child: new GridTile(
                header: Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(right: 10, top: 10),
                    child: lamps[index].isfavorite
                        ? Icon(
                            Icons.favorite,
                            color: Colors.redAccent,
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: Colors.redAccent,
                          )),
                footer: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          lamps[index].title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$ ${lamps[index].price}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Image.network(
                    lamps[index].image['url'],
                    height: 60,
                    width: 100,
                    fit: BoxFit.fill,
                    //alignment: Alignment.center,
                  ),
                ), //just for testing, will fill with image later
              ),
            ),
          );
        },
      ),
    );
  }
}
