import 'package:flutter/material.dart';
import 'package:aghaz/helper/ScreenSize.dart';

class AghazCard extends StatelessWidget {
  final String name;
  final String date;
  final String title;
  final String imageUrl;
  final String detail;
  final String additionalDetail;
  final Color color;

  const AghazCard(
      {Key key,
      @required this.name,
      @required this.date,
      @required this.title,
      @required this.additionalDetail,
      @required this.detail,
      @required this.imageUrl,
      @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: ScreenSize.blockSizeHorizontal * 100,
          height: ScreenSize.blockSizeVertical * 50,
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                CircleAvatar(backgroundColor: Colors.black87),
                          ),
                          Text(name),
                          Text(date)
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)),
                      ),
                      width: ScreenSize.blockSizeHorizontal * 100,
                      height: ScreenSize.blockSizeVertical * 10),
                  Container(
                      child: Center(
                        child: Icon(Icons.image),
                      ),
                      color: Colors.black38,
                      width: ScreenSize.blockSizeHorizontal * 100,
                      height: ScreenSize.blockSizeVertical * 25),
                  Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(title),
                          Text(detail),
                          Text(additionalDetail)
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      width: ScreenSize.blockSizeHorizontal * 100,
                      height: ScreenSize.blockSizeVertical * 13.8),
                ],
              )),
        ),
      ),
    );
  }
}
