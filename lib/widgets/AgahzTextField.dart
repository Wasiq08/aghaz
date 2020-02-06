import 'package:aghaz/helper/ScreenSize.dart';
import 'package:flutter/material.dart';

enum TextFieldType { simple, detail ,cutom}

class AghazTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final String lable;
  final bool obscure;
  final FocusNode focusNode;
  final FocusNode focusNodeOther;
  final TextFieldType type;

  const AghazTextField(
      {Key key,
      @required this.hint,
       this.icon,
      @required this.lable,
      this.obscure = false,
      this.focusNode,
      this.focusNodeOther,
      this.type = TextFieldType.simple})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);

    if(type==TextFieldType.cutom){
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
            ),
          ),
        ),
      ),
    );
    }

    if (type == TextFieldType.detail) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: ScreenSize.blockSizeHorizontal * 100,
          height: ScreenSize.blockSizeVertical * 20,
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
            maxLines: 4,
            maxLength: 80,
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
            //maxLength: 20,
            decoration: InputDecoration(
              labelText: lable,
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
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
              ),
            ),
          ),
        ),
      );
    }

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
            ),
          ),
        ),
      ),
    );
  }
}
