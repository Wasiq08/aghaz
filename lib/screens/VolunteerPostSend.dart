import 'package:aghaz/screens/SignInPage.dart';
import 'package:aghaz/widgets/AgahzTextField.dart';
import 'package:aghaz/widgets/AghazButton.dart';
import 'package:aghaz/widgets/AghazCard.dart';
import 'package:flutter/material.dart';

class VolunteerPostSend extends StatelessWidget {
  const VolunteerPostSend({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AghazCard(
            name: 'UserName',
            date: 'March 20 2020',
            title: 'Water',
            additionalDetail: 'asnajskfnajkfna',
            detail: 'Karachi,Pakistan Johar bloc 5',
            imageUrl: 'null',
            color: Colors.blueAccent),
        AghazButton(
            lable: 'Send',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInPage(),
                ),
              );
            },
            color: Colors.blueAccent)
      ],
    );
  }
}
