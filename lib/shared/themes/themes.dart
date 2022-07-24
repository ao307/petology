import 'package:doctor_care/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme() => ThemeData(
      useMaterial3: true,
      iconTheme: const IconThemeData(color: MyColors.cIconLight),
      dividerTheme: const DividerThemeData(color: Colors.black),
      primarySwatch: MyColors.cPrimary,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: MyColors.cAppBarTextLight,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w700,
        ),
        elevation: 0.0,
        backgroundColor: MyColors.cAppBarLight,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        iconTheme: IconThemeData(
          color: MyColors.cAppBarIconLight,
        ),
      ),
      //primarySwatch: MyColors.cPrimary,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: MyColors.cPrimary,
      ),
      fontFamily: 'Cairo',
      textTheme: const TextTheme(
        bodyText1: TextStyle(),
        bodyText2: TextStyle(),
        headline1: TextStyle(),
        headline6: TextStyle(),
        button: TextStyle(color: MyColors.cTextButtonLight),
        caption: TextStyle(),
        headline2: TextStyle(),
        headline3: TextStyle(),
        headline4: TextStyle(),
        headline5: TextStyle(),
        overline: TextStyle(),
        subtitle1: TextStyle(),
        subtitle2: TextStyle(),
      ).apply(
        bodyColor: MyColors.cTextLight,
        displayColor: Colors.blue,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme:
            IconThemeData(size: 30.0, color: MyColors.cUnSelectedIconLight),
        selectedIconTheme:
            IconThemeData(size: 30.0, color: MyColors.cSelectedIcon),
        backgroundColor: MyColors.cBottomBarLight,
        selectedItemColor: MyColors.cSelectedIcon,
        unselectedItemColor: MyColors.cUnSelectedIconLight,
        elevation: 8.0,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12.0,
          height: 2.0,
          color: MyColors.cSelectedIcon,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12.0,
          height: 2.0,
          color: MyColors.cUnSelectedIconLight,
        ),
      ),
      scaffoldBackgroundColor: MyColors.cScaffoldBackgroundColorLight,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: MyColors.cPrimary,
      ),
    );

ThemeData darkTheme() => ThemeData(
      useMaterial3: true,
      iconTheme: const IconThemeData(color: MyColors.cIconDark),
      dividerTheme: const DividerThemeData(color: Colors.black),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: MyColors.cAppBarTextDark,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w700,
        ),
        elevation: 0.0,
        backgroundColor: MyColors.cAppBarDark,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        iconTheme: IconThemeData(
          color: MyColors.cAppBarIconDark,
        ),
      ),
      primarySwatch: MyColors.cPrimary,
      fontFamily: 'Cairo',
      textTheme: const TextTheme(
        bodyText1: TextStyle(),
        bodyText2: TextStyle(),
        headline1: TextStyle(),
        headline6: TextStyle(),
        button: TextStyle(color: MyColors.cTextButtonDark),
        caption: TextStyle(),
        headline2: TextStyle(),
        headline3: TextStyle(),
        headline4: TextStyle(),
        headline5: TextStyle(),
        overline: TextStyle(),
        subtitle1: TextStyle(),
        subtitle2: TextStyle(),
      ).apply(
        bodyColor: MyColors.cTextDark,
        displayColor: Colors.blue,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme:
            IconThemeData(size: 30.0, color: MyColors.cUnSelectedIconDark),
        selectedIconTheme:
            IconThemeData(size: 30.0, color: MyColors.cSelectedIcon),
        backgroundColor: MyColors.cBottomBarDark,
        selectedItemColor: MyColors.cSelectedIcon,
        unselectedItemColor: MyColors.cUnSelectedIconDark,
        elevation: 8.0,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12.0,
          height: 2.0,
          color: MyColors.cSelectedIcon,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12.0,
          height: 2.0,
          color: MyColors.cUnSelectedIconDark,
        ),
      ),
      scaffoldBackgroundColor: MyColors.cScaffoldBackgroundColorDark,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: MyColors.cPrimary,
      ),
    );
