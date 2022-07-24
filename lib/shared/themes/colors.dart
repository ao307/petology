import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class MyColors {
//0xff
  static const MaterialColor cPrimary = MaterialColor(
    0xff0f357a,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffce5641), //10%
      100: Color(0xffb74c3a), //20%
      200: Color(0xffa04332), //30%
      300: Color(0xff89392b), //40%
      400: Color(0xff733024), //50%
      500: Color(0xff5c261d), //60%
      600: Color(0xff451c16), //70%
      700: Color(0xff2e130e), //80%
      800: Color(0xff170907), //90%
      900: Color(0xff000000), //100%
    },
  );

  static const cIconLight = Color(0xff0f357a);
  static const cIconDark = Colors.white;

  static const cCardsColorLight = Color(0xff0f357a);
  static const cCardsColorDark = Color(0xff393E46);

  static const cScaffoldBackgroundColorLight = Colors.white;
  static const cScaffoldBackgroundColorDark = Color(0xff222831);

  static const cDividerLight = Colors.black;
  static const cDividerDark = Colors.white;

  static const cAppBarLight = Colors.white;
  static const cAppBarDark = Color(0xff222831);

  static const cAppBarTextLight = Color(0xff0f357a);
  static const cAppBarTextDark = Colors.white;

  static const cAppBarIconLight =  Color(0xff0f357a);
  static const cAppBarIconDark = Colors.white;

  static const cErrorColor = Color(0xffBC2729);

  static const cBottomBarLight = Colors.white;
  static const cBottomBarDark = Color(0xff222831);

  static const cTextLight = Color(0xff0f357a);
  static const cTextDark = Colors.white;

  static const cTextButtonLight = Color(0xff0f357a);
  static const cTextButtonDark = Colors.white;

  static const cTextSubtitleLight = Color(0xff3EA7C4);
  static const cTextSubtitleLight2 = Color(0xff3EA7C4);
  static const cTextSubtitleDark = Colors.white;

  static const cSelectedIcon = Color(0xff0f357a);
  static const cUnSelectedIconLight = Color(0xff707070);
  static const cUnSelectedIconDark = Colors.white;
}
