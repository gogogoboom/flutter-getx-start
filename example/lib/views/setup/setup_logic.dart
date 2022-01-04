import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gogoboom_flutter_getx_start_example/common/theme/theme_dark.dart';
import 'package:gogoboom_flutter_getx_start_example/common/theme/theme_white.dart';

import 'setup_state.dart';

class SetupLogic extends GetxController {
  final SetupState state = SetupState();

  get isNightMode => state.isNightMode.value;

  get isTranslation => state.isTranslation.value;

  onNightMode(BuildContext context, bool value) {
    // Get.changeThemeMode(context.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    Get.changeTheme(context.isDarkMode ? themeWhite : themeDark);
    Get.forceAppUpdate();
    state.isNightMode.toggle();
  }

  @override
  void onInit() {
    state.isNightMode.value = Get.isDarkMode;
    state.isTranslation.value = Get.locale == const Locale('en');
    super.onInit();
  }

  onTranslation(BuildContext context, bool value) {
    bool isTranslation = Get.locale == const Locale('zh');
    Get.updateLocale(isTranslation ? const Locale('en') : const Locale('zh'));
    state.isTranslation.toggle();
  }
}
