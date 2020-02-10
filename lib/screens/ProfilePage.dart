import 'package:aghaz/model/user.dart';
import 'package:aghaz/widgets/profile/profile_body.dart';
import 'package:aghaz/widgets/profile/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage(
    this.user, {
    @required this.avatarTag,
  });

  final User user;
  final Object avatarTag;

  @override
  _ProfilePageState createState() => new _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var linearGradient = const BoxDecoration(
      gradient: const LinearGradient(
        begin: FractionalOffset.centerRight,
        end: FractionalOffset.bottomLeft,
        colors: <Color>[
          const Color(0xFF413070),
          const Color(0xFF2B264A),
        ],
      ),
    );

    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          decoration: linearGradient,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new ProfileHeader(
                widget.user,
                avatarTag: widget.avatarTag,
              ),
              new Padding(
                padding: const EdgeInsets.all(24.0),
                child: new ProfileBody(widget.user),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
