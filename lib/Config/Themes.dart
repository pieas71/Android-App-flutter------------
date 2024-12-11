import 'package:mobile_app/Config/Colors.dart';
import 'package:flutter/material.dart';

var lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primaryColor,
        onPrimary: backgroundColor,
        secondary: secondryColor,
        onSecondary: backgroundColor,
        error: Colors.red,
        onError: fontColor,
        background: backgroundColor,
        onBackground: fontColor,
        surface: backgroundColor,
        onSurface: fontColor),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 40,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: levelColor),
      labelMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: levelColor),
      labelSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: levelColor,
      ),
    ));
