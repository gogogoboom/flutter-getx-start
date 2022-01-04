import 'package:flutter/material.dart';

import '../../global/i_style.dart';

final ThemeData themeWhite = ThemeData.light().copyWith(
  brightness: Brightness.light,
  primaryColorBrightness: Brightness.light,
  primaryColor: Colors.white,
  primaryColorDark: const Color(0xfffc7a7f),
  bottomAppBarColor: const Color(0xfffc7a7f),
  unselectedWidgetColor: Colors.grey,
  highlightColor: const Color(0x1a099f7f),
  backgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: IConstant.lagerTextSize,
          fontWeight: FontWeight.bold)),
);
