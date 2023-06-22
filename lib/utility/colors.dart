import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor =
      const Color.fromRGBO(64, 64, 255, 1.0); //use for main color of app
  static MaterialColor primaryColorMaterial =
      MaterialColor(0xff4040ff, primaryColorMaterial_material);
  static Color secondaryColor = const Color.fromRGBO(10, 10, 38, 1.0);
  static Color lightTheemColor = Color(0xffd9d7fc);
  static Color backGroundColor = const Color.fromRGBO(255, 255, 255, 1.0);
  static Color accentColor = const Color.fromRGBO(253, 201, 32, 1.0);
  static Color warningColor = const Color.fromRGBO(233, 131, 21, 1.0);

  //grey shadows
  static Color grey5 = const Color.fromRGBO(71, 71, 92, 1.0);
  static Color grey4 = const Color.fromRGBO(132, 132, 147, 1.0);
  static Color grey3 = const Color.fromRGBO(194, 194, 201, 1.0);
  static Color grey2 = const Color.fromRGBO(231, 231, 233, 1.0);
  static Color grey1 = const Color.fromRGBO(243, 243, 244, 1.0);

  //others
  static Color red = const Color.fromRGBO(223, 58, 77, 1.0);
  static Color green = const Color.fromRGBO(58, 130, 71, 1.0);
  static Color black = const Color.fromRGBO(0, 0, 0, 1.0);
  static Color white = const Color.fromRGBO(255, 255, 255, 1.0);

  //shadow colors]
  static Color dropShadow100 = const Color.fromRGBO(132, 132, 132, 1.0);
}

Map<int, Color> primaryColorMaterial_material = {
  50: Color.fromRGBO(64, 64, 255, .1),
  100: Color.fromRGBO(64, 64, 255, .2),
  200: Color.fromRGBO(64, 64, 255, .3),
  300: Color.fromRGBO(64, 64, 255, .4),
  400: Color.fromRGBO(64, 64, 255, .5),
  500: Color.fromRGBO(64, 64, 255, .6),
  600: Color.fromRGBO(64, 64, 255, .7),
  700: Color.fromRGBO(64, 64, 255, .8),
  800: Color.fromRGBO(64, 64, 255, .9),
  900: Color.fromRGBO(64, 64, 255, 1),
};
