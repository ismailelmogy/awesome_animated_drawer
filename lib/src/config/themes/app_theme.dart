import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: AppStrings.fontName,
    primaryColor: AppColors.primaryColor,
    hintColor: AppColors.hintColor,
    platform: TargetPlatform.iOS,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          elevation: 0,
          textStyle: const TextStyle(
              fontFamily: AppStrings.fontName,
              fontWeight: FontWeight.w700,
              fontSize: 14)),
    ),
    textTheme: const TextTheme(
      // style of button
      labelLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),

      // style of text form field
      labelSmall: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryColor),
      hintStyle: TextStyle(
          color: AppColors.hintColor,
          fontSize: 14,
          fontWeight: FontWeight.w500),
      errorStyle: const TextStyle(
          fontSize: 13, fontWeight: FontWeight.w400, color: Colors.red),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: AppColors.hintColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: AppColors.hintColor)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(32),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(32),
      ),
    ),
  );
}
