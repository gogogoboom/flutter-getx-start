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
                // 你的翻译
                locale: const Locale('zh'),
                // 将会按照此处指定的语言翻译
                supportedLocales: const <Locale>[
                  Locale('en'),
                  Locale('zh'),
                ],
                // 添加一个回调语言选项，以备上面指定的语言翻译不存在
                fallbackLocale: const Locale('en'),
                localeListResolutionCallback:
                    (List<Locale>? locales, Iterable<Locale> supportedLocales) {
                  logger.d('当前系统语言环境$locales');
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
    // 构建错误信息
    return FlutterErrorDetails(stack: stackTrace, exception: error);
  }

  FlutterError.onError = (FlutterErrorDetails details) {
    //获取 widget build 过程中出现的异常错误
    reportErrorAndLog(details);
  };
  runZonedGuarded(
    () {
      runApp(const MyApp());
    },
    (Object error, StackTrace stackTrace) {
      //没被我们catch的异常
      reportErrorAndLog(makeDetails(error, stackTrace));
    },
  );
}
