import 'package:aghaz/helper/ScreenSize.dart';
import 'package:flutter/material.dart';

class AghazButton extends StatelessWidget {
  final String lable;
  final Function onPress;
  final Color color;
  const AghazButton(
      {Key key,
      @required this.lable,
      @required this.onPress,
      @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(2, 2),
                  blurRadius: 2.5,
                  spreadRadius: 1)
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          width: ScreenSize.blockSizeHorizontal * 100,
          height: ScreenSize.blockSizeVertical * 8,
          child: Center(
            child: Text(
              lable,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
