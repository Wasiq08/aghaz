import 'package:aghaz/helper/ScreenSize.dart';
import 'package:aghaz/widgets/AgahzTextField.dart';
import 'package:aghaz/widgets/AghazButton.dart';
import 'package:flutter/material.dart';

class VolunteerDetail extends StatelessWidget {
  PageController controller;
  VolunteerDetail(this.controller);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Container(
      width: ScreenSize.blockSizeHorizontal * 100,
      height: ScreenSize.blockSizeVertical * 100,
      child: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          AghazTextField(
              hint: 'Enter Detail',
              type: TextFieldType.detail,
              lable: "Description"),
          AghazTextField(
              hint: 'Data', lable: 'march 02 2020', type: TextFieldType.cutom),
          AghazTextField(
              hint: 'Location',
              lable: 'Karachi,Pakistan Johar block 5',
              type: TextFieldType.cutom),
          AghazButton(
              lable: 'Next',
              onPress: () {
                controller.animateToPage(
                  1,
                  curve: Curves.ease,
                  duration: Duration(seconds: 1),
                );
              },
              color: Theme.of(context).accentColor),
         
        ],
      ),
    );
  }
}
