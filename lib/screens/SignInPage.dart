import 'package:aghaz/helper/ScreenSize.dart';
import 'package:aghaz/screens/SignUpPage.dart';
import 'package:aghaz/screens/volunter_post/VolunteerPost.dart';
import 'package:aghaz/widgets/AgahzTextField.dart';
import 'package:aghaz/widgets/AghazButton.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  FocusNode f1;
  FocusNode f2;

  @override
  void initState() {
    f1 = FocusNode();
    f2 = FocusNode();
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
                  "Sign In",
                  style: TextStyle(
                      fontFamily: 'Sans',
                      fontWeight: FontWeight.w200,
                      fontSize: 35,
                      letterSpacing: 1),
                ),
                Padding(padding: EdgeInsets.all(8)),
                AghazTextField(
                  hint: "Enter Email Address",
                  icon: EvaIcons.email,
                  lable: 'Email',
                  focusNode: f1,
                  focusNodeOther: f2,
                ),
                Padding(padding: EdgeInsets.all(8)),
                AghazTextField(
                  focusNode: f2,
                  focusNodeOther: f2,
                  hint: "Enter Password",
                  icon: EvaIcons.lock,
                  lable: 'Password',
                  obscure: true,
                ),
                Padding(padding: EdgeInsets.all(8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    AghazButton(
                        lable: 'Sign in',
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VolunteerPost(),
                            ),
                          );
                        },
                        color: Theme.of(context).accentColor),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up',
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
