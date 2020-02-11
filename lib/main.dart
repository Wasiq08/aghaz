import 'package:aghaz/screens/SplashScreen.dart';
import 'package:aghaz/themes/app_theme.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //making list of pages needed to pass in IntroViewsFlutter constructor.


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aghaz',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.aghazTheme(),
      home: SplashScreen()
//      IntroViewsFlutter(
//        pages,
//        showNextButton: true,
//        showBackButton: true,
//        onTapDoneButton: () {
//          Navigator.push(
//            context,
//            MaterialPageRoute(
//              builder: (context) => NavigationHomeScreen(),
//            ), //MaterialPageRoute
//          );
//        },
//        pageButtonTextStyles: TextStyle(
//          color: Colors.white,
//          fontSize: 18.0,
//        ),
//      ), //IntroViewsFlutter
    );
  }
}
