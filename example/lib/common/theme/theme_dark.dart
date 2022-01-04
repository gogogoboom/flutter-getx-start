import 'package:flutter/material.dart';
import '../../global/i_style.dart';

final ThemeData themeDark = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  primaryColorBrightness: Brightness.dark,
  primaryColor: const Color(0xFF000000),
  primaryColorDark: const Color(0xFF000000),
  bottomAppBarColor: Colors.white,
  unselectedWidgetColor: Colors.white24,
  highlightColor: const Color(0xff363636),
  backgroundColor: const Color(0xFF000000),
  appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: IConstant.lagerTextSize,
          fontWeight: FontWeight.bold)),
);
