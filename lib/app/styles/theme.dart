import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  AppTheme._();

  static darkTheme() {
    return lightTheme();
  }

  static lightTheme() {
    return ThemeData(
        primaryColor: AppColors.lightPrimaryColor,
        secondaryHeaderColor: AppColors.lightSecondaryColor,
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: AppColors.lightPrimaryColor,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
          color: AppColors.lightSecondaryColor,
          iconTheme: IconThemeData(color: AppColors.iconColor),
          elevation: 0,
        ),
        colorScheme: ColorScheme.light(
          primary: AppColors.lightPrimaryColor,
          secondary: AppColors.lightSecondaryColor,
        ),
        iconTheme: IconThemeData(
          color: AppColors.iconColor,
        ),
        textTheme: _lightTextTheme,
        dividerTheme: DividerThemeData(color: Colors.black12),
        textSelectionTheme: TextSelectionThemeData(cursorColor: AppColors.lightGray2));
  }

  static final TextTheme _lightTextTheme = TextTheme(
    // heading 1 style
    headline1: TextStyle(
      color: AppColors.lightPrimaryColor,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
      fontSize: 48,
    ),
    // heading 2 style
    headline2: TextStyle(
      color: AppColors.lightPrimaryColor,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
    // genre card style
    headline3: TextStyle(
      color: AppColors.lightGray3,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    // body style
    bodyText1: TextStyle(
      color: AppColors.lightGray3,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    // search box style
    caption: TextStyle(
      color: AppColors.lightGray2,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.normal,
      fontSize: 16,
    ),
    // book name style
    subtitle1: TextStyle(
      color: AppColors.lightGray3,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
      fontSize: 12,
    ),
    // book author style
    subtitle2: TextStyle(
      color: AppColors.lightGray2,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.normal,
      fontSize: 12,
    ),
    headline6: TextStyle(
      color: AppColors.lightPrimaryColor,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
      fontSize: 26,
    ),
  );
}
