import 'package:aghaz/app_theme.dart';
import 'package:aghaz/navigation_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //making list of pages needed to pass in IntroViewsFlutter constructor.
  final pages = [
    PageViewModel(
        pageColor: const Color(0xFF03A9F4),
        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Image.asset('assets/images/claims.png'),
        body: Text(
          'Take picture of the problems you encounter in your city(garbage piled up , degraded roads, severage) and share them on  Aghaz social network',
        ),
        title: Text(
          'Share Your Claims',
        ),
        titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white , fontSize: 50.0),
        bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white, fontSize: 15.0),
        mainImage: Image.asset(
          'assets/images/claims.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),
    PageViewModel(
      pageColor: AppTheme.buildLightTheme().primaryColor,
      iconImageAssetPath: 'assets/images/rewards.png',
      body: Text(
        'Authentic and verified claims earn you points redeemble for gifts',
      ),
      title: Text('Get Your Rewards'),
      mainImage: Image.asset(
        'assets/images/rewards.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white, fontSize: 50.0),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white, fontSize: 15.0),
    ),
    PageViewModel(
      pageColor: const Color(0xFF607D8B),
      iconImageAssetPath: 'assets/images/project.png',
      body: Text(
        'Earn Money and Participate in Community or Organization Project',
      ),
      title: Text('Engage In Community'),
      mainImage: Image.asset(
        'assets/images/project.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white, fontSize: 50.0),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white, fontSize: 15.0),
    ),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aghaz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          showNextButton: true,
          showBackButton: true,
          onTapDoneButton: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavigationHomeScreen(),
              ), //MaterialPageRoute
            );
          },
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ),
    );
  }
}
