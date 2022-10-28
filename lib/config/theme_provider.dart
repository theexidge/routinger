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
    backgroundColor: kPowderBlue,
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
      headline4: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.25,
        color: darkThemeHeadline4,
      ),
      headline5: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
        height: 2,
        color: darkThemeHeadline5,
      ),
      headline6: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        height: 2,
        color: darkThemeTextColor,
      ),
      subtitle1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        color: darkThemeSubTextColor,
      ),
      subtitle2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: darkThemeSubTextColor,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: darkThemeSubTextColor,
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: darkThemeSubTextColor,
      ),
      button: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.25,
        color: kRoyalBlueDark,
      ),
    ),
    // drawerTheme: DrawerThemeData(
    //   backgroundColor: darkThemeNavBarColor,
    // ),
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
    backgroundColor: kPowderBlue,
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
      headline4: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.25,
        color: kRoyalBlueDark,
      ),
      headline5: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
        height: 2,
        color: kRoyalBlueDark,
      ),
      headline6: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        height: 2,
        color: kRoyalBlueDark,
      ),
      subtitle1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        color: kRoyalBlueDark,
      ),
      subtitle2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: kRoyalBlueDark,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: kRoyalBlueDark,
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: kRoyalBlueDark,
      ),
      button: TextStyle(
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
