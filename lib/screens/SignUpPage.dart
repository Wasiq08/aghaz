import 'package:aghaz/helper/ScreenSize.dart';
import 'package:aghaz/screens/SignInPage.dart';
import 'package:aghaz/widgets/AgahzTextField.dart';
import 'package:aghaz/widgets/AghazButton.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FocusNode f1;
  FocusNode f2;
  FocusNode f3;
  FocusNode f4;

  @override
  void initState() {
    f1 = FocusNode();
    f2 = FocusNode();
    f3 = FocusNode();
    f4 = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(5),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Icon(
                  EvaIcons.bulb,
                  size: 40,
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(
                      fontFamily: 'Sans',
                      fontWeight: FontWeight.w200,
                      fontSize: 35,
                      letterSpacing: 1),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                ),
                AghazTextField(
                  hint: "Enter your full name",
                  icon: EvaIcons.person,
                  lable: 'Name',
                  focusNode: f1,
                  focusNodeOther: f2,
                ),
                Padding(padding: EdgeInsets.all(8)),
                AghazTextField(
                  hint: "Enter Email Address",
                  icon: EvaIcons.email,
                  lable: 'Email',
                  focusNode: f2,
                  focusNodeOther: f3,
                ),
                Padding(padding: EdgeInsets.all(8)),
                AghazTextField(
                  hint: "Enter Password",
                  icon: EvaIcons.lock,
                  lable: 'Password',
                  obscure: true,
                  focusNode: f3,
                  focusNodeOther: f4,
                ),
                Padding(padding: EdgeInsets.all(8)),
                AghazTextField(
                  hint: "Enter Password",
                  icon: EvaIcons.lock,
                  lable: 'Password Again',
                  obscure: true,
                  focusNode: f4,
                  focusNodeOther: f4,
                ),
                Padding(padding: EdgeInsets.all(8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    AghazButton(
                        lable: 'Sign Up',
                        onPress: () {},
                        color: Theme.of(context).accentColor),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontFamily: 'Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 1),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
