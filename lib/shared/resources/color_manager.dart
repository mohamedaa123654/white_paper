import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = Colors.blue;
  static Color darkGrey = const Color(0xff333739);
  static Color grey = const Color(0xff737477);
  static Color lightGrey = const Color(0xff9E9E9E);
  static Color black = const Color(0xff000000);
  static Color defaultColor = Colors.blue;

  // new colors
  static Color? darkPrimary = Colors.blue[400];
  static Color lightPrimary = Colors.blue; // color with 80% opacity
  static Color grey1 = const Color(0xff707070);
  static Color grey2 = const Color(0xff797979);
  static Color white = const Color(0xffFFFFFF);
  static Color error = const Color(0xffe61f34); // red color
}
