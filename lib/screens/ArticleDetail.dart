import 'package:aghaz/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildTopLayout(),
    );
  }
}

Widget buildTopLayout() {
  return Container(
    child: Column(
      children: <Widget>[
        Image.asset('assets/images/img1.jpeg'),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            '7 eco friendly tips to Keep Environment Clean',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        buildSubtitile('By Wasiq Muhammad'),
        buildBody()
      ],
    ),
  );
}

Widget buildBody() {
  final String content =
      'Scientists say evidence is mounting that trees can have a far-reaching effect in stemming global warming by removing huge amounts of carbon from the atmosphere. A recent study bolsters this idea, and tree-planting advocates say it’s something they’ve known for decades.';

  return Container(
    padding: EdgeInsets.all(5),
    child: Text(content),
  );
}

Widget buildSubtitile(content){
  return Container(
    child: Text(
      content
    ),
  );

}