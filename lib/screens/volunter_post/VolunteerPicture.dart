import 'package:aghaz/helper/ScreenSize.dart';
import 'package:aghaz/widgets/AghazButton.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class VolunteerPicture extends StatelessWidget {
  final PageController controller;
  const VolunteerPicture({Key key, @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Container(
      child: Center(
        child: Container(
          width: ScreenSize.blockSizeHorizontal * 80,
          height: ScreenSize.blockSizeVertical * 100,
          child: Center(
            child: Column(
              children: <Widget>[
                Icon(EvaIcons.cameraOutline),
                AghazButton(
                    lable: 'Next',
                    onPress: () {
                      controller.animateToPage(2, duration: Duration(seconds: 1), curve: Curves.ease);
                    },
                    color: Theme.of(context).accentColor),
                    AghazButton(
                    lable: 'back',
                    onPress: () {
                      controller.animateToPage(1, duration: Duration(seconds: 1), curve: Curves.ease);
                    },
                    color: Theme.of(context).accentColor)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
