import 'package:aghaz/widgets/AgahzTextField.dart';
import 'package:aghaz/widgets/AghazButton.dart';
import 'package:aghaz/widgets/AghazCard.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AghazButton(
                lable: "Button",
                onPress: () {
                  print("Pressed");
                },
                color: Colors.greenAccent,
              ),
              AghazCard(
                name: "Name",
                date: "12/30/2020",
                detail: "Some Detail",
                color: Colors.blueAccent,
                imageUrl: "",
                title: "Title",
                additionalDetail: "Additional Detail",
              ),
              AghazTextField(
                lable: "Email",
                hint: "Enter Email Address",
                icon: Icons.mail,
              )
            ],
          ),
        ));
  }
}
