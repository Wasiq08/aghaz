import 'dart:async';

import 'package:aghaz/bloc/post_bloc/post_bloc.dart';
import 'package:aghaz/bloc/post_bloc/post_event.dart';
import 'package:aghaz/helper/ScreenSize.dart';
import 'package:aghaz/services/firebase_store/FirebaseStore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class VolunteerPostSend extends StatefulWidget {
  final String title;
  final String detail;
  final String imageUrl;

  const VolunteerPostSend(
      {Key key,
      @required this.title,
      @required this.detail,
      @required this.imageUrl})
      : super(key: key);

  @override
  _VolunteerPostSendState createState() => _VolunteerPostSendState();
}

class _VolunteerPostSendState extends State<VolunteerPostSend> {
  PostBloc bloc;
  FirebaseStore store;
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    store = FirebaseStore();
    bloc = PostBloc(store: store);
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text('Send'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          Card(
            elevation: 0.5,
            child: Wrap(
              spacing: 10,
              direction: Axis.vertical,
              children: <Widget>[
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 15,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      child: Center(
                        child: Text("AC"),
                      ),
                    ),
                    Wrap(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Text(
                          'By: Ahmed Ali Khan',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          DateTime.now().toString(),
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: ScreenSize.blockSizeHorizontal * 100,
                  height: ScreenSize.blockSizeVertical * 25,
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.subhead,
                ),
                Text(
                  widget.detail,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 16),
            child: RaisedButton.icon(
              onPressed: () {
                globalKey.currentState.showSnackBar(
                  SnackBar(
                    content: Text("Loading"),
                  ),
                );
                bloc.add(
                  UploadPost(
                      title: widget.title,
                      detail: widget.detail,
                      imageUrl: widget.imageUrl),
                );
                Timer(Duration(seconds: 5), () {
                  Navigator.pop(context);
                });
              },
              icon: Icon(EvaIcons.paperPlane),
              label: Text("Upload"),
            ),
          ),
        ],
      ),
    );
  }
}
