import 'package:flutter/material.dart';

class MyRewards extends StatelessWidget {
  const MyRewards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Rewards'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 6,
              child: Container(
                padding: EdgeInsets.all(5),
                child: ListTile(
                  leading: Image.asset('assets/images/img2.jpg'),
                  title: Text('LuckyOne Mall with Flat 50%'),
                  subtitle: Container(
                    child: Column(
                      children: <Widget>[
                        Text('Avail now to this offer'),
                        Text('Avail now to this offer'),
                        Text('Avail now to this offer'),
                        Text('Avail now to this offer'),
                        Text('Avail now to this offer'),
                      ],
                    ),
                  ),
                  trailing: Text('400 POINTS'),
                ),
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  onPressed: () {},
                  child: Text('REDEEM'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
