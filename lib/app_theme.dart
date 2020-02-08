import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'WorkSans';

  static ThemeData aghazTheme() {
    ThemeData data = ThemeData(
      appBarTheme: AppBarTheme(
          color: Color(0xff16a085),
          iconTheme: IconThemeData(color: Colors.white, size: 24)),
      primaryColor: Color(0xff16a085),
      primaryColorDark: Color(0xff16a085),
      accentColor: Color(0xff16a085),
      scaffoldBackgroundColor: notWhite,
      textTheme: TextTheme(
        title: GoogleFonts.sourceSansPro(
          color: darkerText,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        subtitle: GoogleFonts.sourceSansPro(
          color: darkerText,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        subhead: GoogleFonts.sourceSansPro(
          color: darkerText,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        caption: GoogleFonts.sourceSansPro(
          color: darkerText,
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
        headline: GoogleFonts.sourceSansPro(
          color: darkerText,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        display1: GoogleFonts.sourceSansPro(
          color: darkerText,
          fontSize: 30,
          fontWeight: FontWeight.w200,
        ),
        display2: GoogleFonts.sourceSansPro(
          color: darkerText,
          fontSize: 35,
          fontWeight: FontWeight.w200,
        ),
        display3: GoogleFonts.sourceSansPro(
          color: darkerText,
          fontSize: 40,
          fontWeight: FontWeight.w200,
        ),
        display4: GoogleFonts.sourceSansPro(
          color: darkerText,
          fontSize: 45,
          fontWeight: FontWeight.w200,
        ),
        body1: GoogleFonts.sourceSansPro(
          color: darkerText,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        body2: GoogleFonts.sourceSansPro(
          color: darkerText,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    return data;
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    const String fontName = 'WorkSans';
    return base.copyWith(
      title: base.title.copyWith(fontFamily: fontName),
      body1: base.title.copyWith(fontFamily: fontName),
      body2: base.title.copyWith(fontFamily: fontName),
      button: base.title.copyWith(fontFamily: fontName),
      caption: base.title.copyWith(fontFamily: fontName),
      display1: base.title.copyWith(fontFamily: fontName),
      display2: base.title.copyWith(fontFamily: fontName),
      display3: base.title.copyWith(fontFamily: fontName),
      display4: base.title.copyWith(fontFamily: fontName),
      headline: base.title.copyWith(fontFamily: fontName),
      overline: base.title.copyWith(fontFamily: fontName),
      subhead: base.title.copyWith(fontFamily: fontName),
      subtitle: base.title.copyWith(fontFamily: fontName),
    );
  }

  static ThemeData buildLightTheme() {
    final Color primaryColor = HexColor('#16a085');
    final Color secondaryColor = HexColor('#ecf0f1');
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      buttonColor: primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      accentColor: secondaryColor,
      canvasColor: Colors.white,
      backgroundColor: const Color(0xFFFFFFFF),
      scaffoldBackgroundColor: const Color(0xFFF6F6F6),
      errorColor: const Color(0xFFB00020),
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
      platform: TargetPlatform.iOS,
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
