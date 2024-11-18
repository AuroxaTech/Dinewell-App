import 'package:dinewell/Constance/colors.dart';
import 'package:dinewell/Constance/constance.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static bool isLightTheme = true;

  static ThemeData getTheme() {
    if (isLightTheme) {
      return lightTheme();
    } else {
      return darkTheme();
    }
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      titleMedium: GoogleFonts.nunitoSans(
          textStyle: TextStyle(color: AppColors.secondary, fontSize: 15)),
      titleSmall: GoogleFonts.nunitoSans(
          textStyle: TextStyle(
              color: base.titleSmall!.color,
              fontSize: 15,
              fontWeight: FontWeight.w500)),
      bodyLarge: GoogleFonts.nunitoSans(
          textStyle: TextStyle(color: AppColors.primaryColor, fontSize: 14)),
      bodyMedium: GoogleFonts.nunitoSans(
          textStyle: TextStyle(color: base.bodyMedium!.color, fontSize: 16)),
      displayLarge: GoogleFonts.nunitoSans(
          textStyle: TextStyle(
              color: base.titleMedium!.color,
              fontSize: 15,
              fontWeight: FontWeight.w500)),
      displayMedium: GoogleFonts.nunitoSans(
          textStyle: TextStyle(color: base.displayMedium!.color, fontSize: 60)),
      displaySmall: GoogleFonts.nunitoSans(
          textStyle: TextStyle(
              color: base.displaySmall!.color,
              fontSize: 40,
              fontWeight: FontWeight.w600)),
      headlineMedium: GoogleFonts.nunitoSans(
          textStyle:
              TextStyle(color: base.headlineMedium!.color, fontSize: 24)),
      headlineSmall: GoogleFonts.nunitoSans(
          textStyle: TextStyle(
              color: base.headlineSmall!.color,
              fontSize: 20.5,
              fontWeight: FontWeight.w700)),
      titleLarge: GoogleFonts.nunitoSans(
          textStyle: TextStyle(
              color: base.titleLarge!.color,
              fontSize: 20,
              fontWeight: FontWeight.w500)),
      bodySmall: GoogleFonts.nunitoSans(
          textStyle: TextStyle(color: base.bodySmall!.color, fontSize: 12)),
      labelLarge: GoogleFonts.nunitoSans(
          textStyle: TextStyle(
              color: base.labelLarge!.color,
              fontSize: 14,
              fontWeight: FontWeight.w500)),
      labelSmall: GoogleFonts.nunitoSans(
          textStyle: TextStyle(color: base.labelSmall!.color, fontSize: 10)),
    );
  }

  static ThemeData lightTheme() {
    Color primaryColor = primaryColorString;
    Color secondaryColor = secondaryColorString;
    final ColorScheme colorScheme = ColorScheme.light().copyWith(
      primary: secondaryColor,
      secondary: secondaryColor,
    );

    final ThemeData base = ThemeData.light();
    return base.copyWith(
      appBarTheme: AppBarTheme(color: Colors.white),
      popupMenuTheme: PopupMenuThemeData(color: Colors.white),
      iconTheme: IconThemeData(color: Color(0xff2b2b2b)),
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      splashColor: Colors.white.withOpacity(0.1),
      hoverColor: Colors.transparent,
      splashFactory: InkRipple.splashFactory,
      highlightColor: Colors.transparent,
      canvasColor: Colors.transparent,
      scaffoldBackgroundColor: HexColor("#FFFFFF"),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.textTheme),
      platform: TargetPlatform.iOS,
      indicatorColor: primaryColor,
      disabledColor: HexColor("#858494"),
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      cardColor: AppColors.primaryColor,
    );
  }

  static ThemeData darkTheme() {
    Color primaryColor = primaryColorString;
    Color secondaryColor = secondaryColorString;
    final ColorScheme colorScheme = ColorScheme.dark().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
        appBarTheme: AppBarTheme(color: Colors.grey[700]),
        popupMenuTheme: PopupMenuThemeData(color: Colors.black),
        colorScheme: colorScheme,
        iconTheme: IconThemeData(color: AppColors.secondary),
        primaryColor: primaryColor,
        indicatorColor: AppColors.secondary,
        splashColor: Colors.white24,
        splashFactory: InkRipple.splashFactory,
        canvasColor: Colors.transparent,
        scaffoldBackgroundColor: Color(0xff111827),
        buttonTheme: ButtonThemeData(
          colorScheme: colorScheme,
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: _buildTextTheme(base.textTheme),
        primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
        platform: TargetPlatform.iOS,
        disabledColor: HexColor("#858494"),
        cardColor: AppColors.primaryColor);
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
