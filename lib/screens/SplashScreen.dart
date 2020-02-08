import 'package:aghaz/custom_drawer/navigation_home_screen.dart';
import 'package:aghaz/helper/ScreenSize.dart';
import 'package:aghaz/screens/HomeLogin.dart';

import 'package:aghaz/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);

    return Scaffold(
      body: IntroViewsFlutter(
        pages,
        columnMainAxisAlignment: MainAxisAlignment.spaceEvenly,
        showNextButton: true,
        showBackButton: true,
        showSkipButton: true,
        onTapSkipButton: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeLogin(),
            ), //MaterialPageRoute
          );
        },
        onTapDoneButton: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeLogin(),
            ), //MaterialPageRoute
          );
        },
        pageButtonTextStyles:
            Theme.of(context).textTheme.subhead.copyWith(color: Colors.white),
      ),
    );
  }

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
        titleTextStyle: GoogleFonts.sourceSansPro(
            fontWeight: FontWeight.w300, fontSize: 40),
        bodyTextStyle: GoogleFonts.sourceSansPro(
            fontWeight: FontWeight.w400, fontSize: 13),
        mainImage: Image.asset(
          'assets/images/claims.png',
          height: 285,
          width: 285,
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
      titleTextStyle:
          GoogleFonts.sourceSansPro(fontWeight: FontWeight.w300, fontSize: 40),
      bodyTextStyle:
          GoogleFonts.sourceSansPro(fontWeight: FontWeight.w400, fontSize: 13),
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
      titleTextStyle:
          GoogleFonts.sourceSansPro(fontWeight: FontWeight.w300, fontSize: 40),
      bodyTextStyle:
          GoogleFonts.sourceSansPro(fontWeight: FontWeight.w400, fontSize: 13),
    ),
  ];
}
