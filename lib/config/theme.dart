//Flutter Packages
import 'package:flutter/material.dart';

//Constant Imports
import '.././constants/palette.dart';

ThemeData buildTheme(BuildContext context) {
  return ThemeData(
    primaryColor: kIndigoDye,
    scaffoldBackgroundColor: kPowderBlue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme(
        background: kPowderBlue,
        brightness: Brightness.dark,
        primary: kPowderBlue,
        onPrimary: Colors.black,
        secondary: kBlueGreen,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.black,
        onBackground: kRoyalBlueDark,
        surface: kMaximumBlueGreen,
        onSurface: Colors.black),
    appBarTheme: AppBarTheme(
      toolbarTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: kRoyalBlueDark,
      ),
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: kRoyalBlueDark,
      ),
      elevation: 0,
      backgroundColor: kPowderBlue,
      iconTheme: const IconThemeData(color: kRoyalBlueDark),
    ),
    iconTheme: const IconThemeData(color: kRoyalBlueDark),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.25,
        color: kRoyalBlueDark,
      ),
      headlineSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
        height: 2,
        color: kRoyalBlueDark,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        height: 2,
        color: kRoyalBlueDark,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        color: kRoyalBlueDark,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: kRoyalBlueDark,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: kRoyalBlueDark,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: kRoyalBlueDark,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.25,
        color: kRoyalBlueDark,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        fontSize: 14,
      ),
      focusColor: kMaximumBlueGreen,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kBlueGreen),
        padding: MaterialStateProperty.all(EdgeInsets.all(12)),
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      dayPeriodColor: kBlueGreen,
      dayPeriodTextColor: kPowderBlue,
      entryModeIconColor: kBlueGreen,
      dialHandColor: kBlueGreen,
      hourMinuteColor: kBlueGreen,
      hourMinuteTextColor: kPowderBlue,
    ),
  );
}
