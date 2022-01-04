import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';

GFAppBar baseAppbar(
    {dynamic title,
    Widget? leading,
    Brightness? brightness,
    List<Widget>? actions,
    double? elevation = 1,
    double? titleSpacing,
    bool? centerTitle = true,
    bool automaticallyImplyLeading = true,
    TextTheme? textTheme,
    IconThemeData? iconTheme,
    PreferredSizeWidget? bottom,
    IconThemeData? iconThemeData}) {
  return GFAppBar(
    brightness: brightness ?? Get.theme.brightness,
    leading: leading,
    backgroundColor: Get.theme.backgroundColor,
    elevation: elevation,
    centerTitle: centerTitle,
    iconTheme: iconTheme ?? Get.theme.iconTheme,
    automaticallyImplyLeading: automaticallyImplyLeading,
    titleSpacing: titleSpacing ?? NavigationToolbar.kMiddleSpacing,
    textTheme: textTheme ?? Get.theme.textTheme,
    title: (title == null)
        ? null
        : ((title is String)
            ? Text(
                title,
                style: Get.theme.appBarTheme.titleTextStyle,
              )
            : title as Widget),
    actions: actions,
    bottom: bottom,
  );
}
