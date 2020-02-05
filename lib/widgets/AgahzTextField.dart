import 'package:aghaz/helper/ScreenSize.dart';
import 'package:flutter/material.dart';

class AghazTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final String lable;
  final bool obscure;
  final FocusNode focusNode;
  final FocusNode focusNodeOther;

  const AghazTextField(
      {Key key,
      @required this.hint,
      @required this.icon,
      @required this.lable,
      this.obscure = false,
      this.focusNode,
      this.focusNodeOther})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: ScreenSize.blockSizeHorizontal * 100,
        height: ScreenSize.blockSizeVertical * 8,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).accentColor.withOpacity(0.3),
                offset: Offset(1.5, 1.5),
                blurRadius: 5,
                spreadRadius: 0.2),
          ],
        ),
        child: TextFormField(
          focusNode: focusNode,
          onFieldSubmitted: (value) {
            if (focusNode == focusNodeOther) {
              FocusScope.of(context).unfocus();
            } else {
              focusNode.unfocus();
              FocusScope.of(context).requestFocus(focusNodeOther);
            }
          },
          obscureText: obscure,
          style: TextStyle(color: Colors.grey),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: lable,
              hintText: hint,
              prefixIcon: Icon(icon),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              )),
        ),
      ),
    );
  }
}
