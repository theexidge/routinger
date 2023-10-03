import 'package:flutter/material.dart';

import '../constants/palette.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    cardColor: darkThemeCardColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkThemeCardColor,
    ),
    scaffoldBackgroundColor: darkThemeBgColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme(
        background: kPowderBlue,
        brightness: Brightness.dark,
        primary: kPowderBlue,
        onPrimary: Colors.white,
        secondary: kBlueGreen,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.black,
        onBackground: kRoyalBlueDark,
        surface: kMaximumBlueGreen,
        onSurface: Colors.white),
    appBarTheme: AppBarTheme(
      toolbarTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: darkThemeAppBarColor,
      ),
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: kRoyalBlueDark,
      ),
      elevation: 0,
      backgroundColor: darkThemeBgColor,
      iconTheme: const IconThemeData(
        color: darkThemeTextColor,
      ),
    ),
    iconTheme: const IconThemeData(color: kRoyalBlueDark),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.25,
        color: darkThemeHeadline4,
      ),
      headlineSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
        height: 2,
        color: darkThemeHeadline5,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        height: 2,
        color: darkThemeTextColor,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        color: darkThemeSubTextColor,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: darkThemeSubTextColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: darkThemeSubTextColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: darkThemeSubTextColor,
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

  static final lightTheme = ThemeData(
    primaryColor: kIndigoDye,
    scaffoldBackgroundColor: kPowderBlue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme(
        background: kPowderBlue,
        brightness: Brightness.light,
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
