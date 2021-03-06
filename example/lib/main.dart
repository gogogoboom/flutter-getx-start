import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';

import 'common/theme/theme_dark.dart';
import 'common/theme/theme_white.dart';
import 'config/chat_common_config.dart';
import 'config/chat_core_config.dart';
import 'config/init.dart';
import 'global/global_binding.dart';
import 'l10n/messages.dart';
import 'routes/page_routes.dart';

void main() async => globalExceptionCatchAndRun();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Initializer.register(
        coreConf: ChatCoreConfig(), commonConf: ChatCommonConfig());
    Initializer.registerGet();
    return FutureBuilder<Widget>(
        builder: (c, _) => ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            builder: () {
              return GetMaterialApp(
                enableLog: true,
                defaultTransition: Transition.cupertino,
                theme: themeWhite,
                darkTheme: themeDark,
                themeMode: ThemeMode.light,
                opaqueRoute: Get.isOpaqueRouteDefault,
                popGesture: Get.isPopGestureEnable,
                getPages: PageRoutes.getRoutes,
                initialRoute: PageRoutes.splash,
                initialBinding: GlobalBinding(),
                builder: BotToastInit(),
                navigatorObservers: [BotToastNavigatorObserver()],
                translations: Messages(),
                localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                  RefreshLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  // uses `flutter_localizations`
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                // ????????????
                locale: const Locale('zh'),
                // ???????????????????????????????????????
                supportedLocales: const <Locale>[
                  Locale('en'),
                  Locale('zh'),
                ],
                // ???????????????????????????????????????????????????????????????????????????
                fallbackLocale: const Locale('en'),
                localeListResolutionCallback:
                    (List<Locale>? locales, Iterable<Locale> supportedLocales) {
                  logger.d('????????????????????????$locales');
                  return;
                },
              );
            }));
  }
}

void globalExceptionCatchAndRun() {
  void reportErrorAndLog(FlutterErrorDetails details) {
    ExceptionHandler.handleException(details);
  }

  FlutterErrorDetails makeDetails(Object error, StackTrace stackTrace) {
    // ??????????????????
    return FlutterErrorDetails(stack: stackTrace, exception: error);
  }

  FlutterError.onError = (FlutterErrorDetails details) {
    //?????? widget build ??????????????????????????????
    reportErrorAndLog(details);
  };
  runZonedGuarded(
    () {
      runApp(const MyApp());
    },
    (Object error, StackTrace stackTrace) {
      //????????????catch?????????
      reportErrorAndLog(makeDetails(error, stackTrace));
    },
  );
}
