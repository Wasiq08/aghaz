import 'package:aghaz/helper/ScreenSize.dart';
import 'package:flutter/material.dart';

class AghazTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final String lable;

  const AghazTextField(
      {Key key, @required this.hint, @required this.icon, @required this.lable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: ScreenSize.blockSizeHorizontal * 100,
        height: ScreenSize.blockSizeVertical * 8,
        child: TextFormField(
          style: TextStyle(color: Colors.grey),
          decoration: InputDecoration(
            labelText: lable,
            hintText: hint,
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(
              // borderSide: BorderSide(color:Colors.white,width:0),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
